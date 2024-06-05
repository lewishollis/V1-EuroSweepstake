// app/javascript/packs/matches.js
import React from 'react';
import ReactDOM from 'react-dom'; // Import ReactDOM
import Matches from '../components/Matches';

document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('matches');
  if (container) {
    ReactDOM.render(<Matches />, container); // Use ReactDOM.render instead of render
  }
});
