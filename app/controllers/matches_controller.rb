# app/controllers/matches_controller.rb
class MatchesController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'

  def index
    # URL to fetch match data from the API
    url = URI("https://web-cdn.api.bbci.co.uk/wc-poll-data/container/sport-data-scores-fixtures?selectedEndDate=2021-07-11&selectedStartDate=2021-06-14&todayDate=2024-06-05&urn=urn%3Abbc%3Asportsdata%3Afootball%3Atournament%3Aeuropean-championship&useSdApi=false")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'

    response = http.request(request)

    if response.is_a?(Net::HTTPSuccess)
      data = JSON.parse(response.body)
      @matches = []

      data['eventGroups'].each do |event_group|
        event_group['secondaryGroups'].each do |secondary_group|
          secondary_group['events'].each do |event|
            # Determine the winner and assign points
            home_score = event['home']['score'].to_i
            away_score = event['away']['score'].to_i
            winner = event['winner']
            accessible_event_summary = event['accessibleEventSummary']

            home_team = Team.find_or_create_by(name: event['home']['fullName'], urn: event['home']['urn'])
            away_team = Team.find_or_create_by(name: event['away']['fullName'], urn: event['away']['urn'])

            match = Match.new(
              stage: secondary_group['displayLabel'],
              home_team: home_team,
              away_team: away_team,
              home_score: home_score,
              away_score: away_score,
              start_time: event['date']['iso'],
              status: event['status'],
              winner: winner,
              accessible_event_summary: accessible_event_summary
            )

            assign_points(match, winner)

            @matches << match
          end
        end
      end
    else
      @error_message = "Failed to fetch match data: #{response.code} - #{response.message}"
    end
  end

  def leaderboard
    @friends = Friend.all.sort_by(&:total_score).reverse
  end

  private

  def assign_points(match, winner)
    if winner == 'home'
      match.home_points = 3
      match.away_points = 0
      increment_team_points(match.home_team, 3)
    elsif winner == 'away'
      match.home_points = 0
      match.away_points = 3
      increment_team_points(match.away_team, 3)
    else
      match.home_points = 1
      match.away_points = 1
      increment_team_points(match.home_team, 1)
      increment_team_points(match.away_team, 1)
    end

    match.save  # Save the match with updated points
  end

  def increment_team_points(team, points)
    team.update(points: (team.points || 0) + points)
  end
end
