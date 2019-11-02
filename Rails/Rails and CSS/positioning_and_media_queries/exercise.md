## CSS Positioning and Media Queries


1. Download the [skeleton][skeleton].
2. Find where your main content/sidebar layout breaks and fix it with a single media query in your grid file. *Hint:* Use an attribute selector
3. Add a hamburger icon to the header navigation that displays at the same min-width as your layout fix. Here are some steps for the hamburger dropdown:
    - duplicate the html for your unordered list of anchor links
    - wrap this in a list element and wrap that list element in another ul
    - name the outer ul with a class like "hamburger-dropdown"
    - select the containing list element and give it a background using this [hamburger](../../assets/images/hamburger.png) file.
    - set the width/height and background-size to 50px/50px
    - set the initial display of the hamburger-dropdown to none
    - use a position property on the unordered list within the hamburger-dropdown so that it does not obstruct the flow of the document and it is directly beneath the list element with the hamburger background
    - use a selector like the following to trigger the hover display effect
    
```css
.hamburger-dropdown:hover ul { 
    display: block;
 }
```
    
[Live version](http://appacademy.github.io/curriculum/positioning_media_queries.html)

[skeleton]: ./skeleton.zip