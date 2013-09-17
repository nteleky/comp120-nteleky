Assignment 1: Performance Review
=====================================
## Comp120: Web Engineering ##
### Nicholas Teleky ###
### Sept 12, 2013 ###

- - - - - - - - - - - - - - - - - - -

For assignment 1, I was required to modify my Frogger project from Comp20 to
optimize it by reducing load times and using the HTML 5 application cache.
While I was in Comp20, I am using Ross Schlaikjer's Frogger application, as mine has
several large bugs that would make optimization pointless.

This README contains information detailing what optimizations were made and how
they affected the overall load and run time.

This assignment took me 4 hours to complete.

- - - - - - - - - - - - - - - - - - - -

### Initial Performance ###

After removing most references to high score and making the frogger game less
efficient (intentionally breaking some rules to see how much I could improve by), 
using YSlow!, I received the following grades:

* B: Make fewer HTTP requests
* B: Use a Content Delivery Network (CDN)
* A: Avoid empty src or href
* D: Add expires headers
* A: Compress components with gzip
* C: Put CSS at top
* A: Reduce DNS lookups
* B: Minify Javascript and CSS
* A: Avoid URL redirects
* A: Remove duplicate Javascript and CSS
* A: Configure entity tags (ETags)
* A: Make AJAX cacheable
* A: Use GET for AJAX requests
* A: Reduce number of DOM elements
* A: Avoid 404 errors
* A: Reduce Cookie size
* A: Use cookie-free domains
* A: Avoid AlphaImageLoader filter
* A: Do not scale images in HTML
* B: Make favicon small and cacheable

Using Chrome Developer Tools, I found the load times for each part:

* frogger -- text/html -- 2.72 seconds to load
* style.css -- text/css -- 0ms sending, 63ms waiting, 1ms receiving
* game.js -- script -- 61ms connecting, 28 ms waiting, 4ms receiving
* frogger_sprites.png -- image/png -- 26ms waiting, 35ms receiving

- - - - - - - - - - - - - - - - - - - -

### Performance Upgrades ###

***Optimization Techniques Used:***

* css/js minified
* HTML5 Application Cache Used
* Changed how images were loaded to make sure they all used a sprite instead of loading a new image everytime.
* CSS moved to top, js moved to body

***HTML5 Cache***

I ensured that this worked by using chrome developer tools to show what elements were being loaded
from the cache and which were being grabbed from a server. After adding the HTML5 cache, all elements were loaded from cache, which severely cut the load time.

***Tools Used***

* YSlow!
* Chrome Developer Tools

***What has been improved ***

After making these improvements, I received the following grade on YSlow!:

* A: Make fewer HTTP requests
* A: Use a Content Delivery Network (CDN)
* A: Avoid empty src or href
* A: Add expires headers
* A: Compress components with gzip
* A: Put CSS at top
* A: Reduce DNS lookups
* A: Minify Javascript and CSS
* A: Avoid URL redirects
* A: Remove duplicate Javascript and CSS
* A: Configure entity tags (ETags)
* A: Make AJAX cacheable
* A: Use GET for AJAX requests
* A: Reduce number of DOM elements
* A: Avoid 404 errors
* A: Reduce Cookie size
* A: Use cookie-free domains
* A: Avoid AlphaImageLoader filter
* A: Do not scale images in HTML
* A: Make favicon small and cacheable

Chome Dev Tools indicated the following load times:
* index.html -- text/html -- 3ms (from cache)
* style.css -- text/css -- 2ms latency
* game.js -- scripe -- 4ms latency
* frogger_sprites.png -- 0ms

***Are there remaining potential performance issues? ***

There are. This could be further improved by improving the server side javascript code, changing
how the game interacts with the scorecenter, and trying to save memory when playing. These
are outside the scope of this project, however, which is why these issues were not addressed.

- - - - - - - - - - - - - - - - - - - - - -

Note: Minified js/css files not included for readability here!

For a link to see these files in action, view:
http://nteleky.github.io/frogger/

