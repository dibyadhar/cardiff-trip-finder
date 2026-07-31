# Cardiff Trip Finder

A mobile-first South and Mid Wales trip planner based near CF10 3EA. It includes destination filters, live weather, a day-by-day itinerary, stay information, shared Supabase checklists, and a Google Maps parking-pin tool.

## Hosting

The site is static and can be hosted directly with GitHub Pages from the `main` branch and repository root.

## Shared List

The grocery and trip checklist uses Supabase. Its browser-safe publishable key is stored in `supabase-config.js`; access is controlled by Row Level Security policies defined in `supabase-setup.sql`.

Destination favourites are stored locally in each browser so they work without an account or network connection.
