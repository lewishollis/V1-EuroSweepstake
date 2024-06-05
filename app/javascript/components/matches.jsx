// app/javascript/components/Matches.jsx
import React, { useEffect, useState } from 'react';
import axios from 'axios';

const Matches = () => {
  const [matches, setMatches] = useState([]);

  useEffect(() => {
    const fetchMatches = async () => {
      try {
        const response = await axios.get('https://api.football-data.org/v4/matches', {
          headers: { 'X-Auth-Token': 'YOUR_API_KEY' }
        });
        setMatches(response.data.matches);
      } catch (error) {
        console.error("There was an error fetching the matches!", error);
      }
    };

    fetchMatches();
  }, []);

  return (
    <div>
      <h1>Football Matches</h1>
      <table>
        <thead>
          <tr>
            <th>Match</th>
            <th>Date</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          {matches.map((match) => (
            <tr key={match.id}>
              <td>{match.homeTeam.name} vs {match.awayTeam.name}</td>
              <td>{new Date(match.utcDate).toLocaleString()}</td>
              <td>{match.status}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default Matches;
