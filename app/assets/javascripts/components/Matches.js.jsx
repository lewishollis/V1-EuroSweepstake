import React, { useEffect, useState } from 'react';
import axios from 'axios';

const Matches = () => {
  const [matches, setMatches] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchMatches = async () => {
      try {
        const response = await axios.get('https://api.football-data.org/v4/competitions/EC/matches', {
          headers: { 'X-Auth-Token': '98d89798b8b44894864385cbd914604a' }
        });
        setMatches(response.data.matches);
      } catch (err) {
        console.error("There was an error fetching the matches!", err);
        setError(err);
      }
    };

    fetchMatches();
  }, []);

  return (
    <div>
      <h1>European Championship Matches</h1>
      {error && <p style={{ color: 'red' }}>Error: {error.message}</p>}
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
