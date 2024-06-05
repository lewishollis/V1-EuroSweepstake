// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import React from 'react';
import { createRoot } from 'react-dom/client';
import Matches from './components/matches';

document.addEventListener('DOMContentLoaded', () => {
  const container = document.getElementById('matches');
  if (container) {
    const root = createRoot(container);
    root.render(<Matches />);
  }
});
