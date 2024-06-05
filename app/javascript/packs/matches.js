// app/javascript/packs/matches.js
import React from 'react';
import { render } from 'react-dom';
import Matches from '../components/Matches';

document.addEventListener('DOMContentLoaded', () => {
  render(<Matches />, document.getElementById('matches'));
});
