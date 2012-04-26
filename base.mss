/* BASE.MSS CONTENTS
 * - Landuse & landcover
 * - Water areas
 * - Water ways
 * - Administrative Boundaries
 *
 */

/* ================================================================== */
/* LANDUSE & LANDCOVER
/* ================================================================== */

#land[zoom>=0][zoom<6],
#shoreline_300[zoom>=6][zoom<10],
#processed_p[zoom>=10] {
  polygon-fill: @land;
  polygon-gamma: 0.75;
}

#landuse_gen0[zoom>3][zoom<=9],
#landuse_gen1[zoom>9][zoom<=12],
#landuse[zoom>12] {
  [type='cemetery']      { polygon-fill: @cemetery; }
  [type='college']       { polygon-fill: @school; }
  [type='commercial']    { polygon-fill: @industrial; }
  [type='forest']        { polygon-fill: @wooded; }
  [type='golf_course']   { polygon-fill: @park; }
  [type='grass']         { polygon-fill: @park; }
  [type='hospital']      { polygon-fill: @hospital; }
  [type='industrial']    { polygon-fill: @industrial; }
  [type='park']          { polygon-fill: @park; }
  [type='parking']       { polygon-fill: @parking; }
  [type='pedestrian']    { polygon-fill: @pedestrian_fill; }
  [type='pitch']         { polygon-fill: @sports; }
  [type='residential']   { polygon-fill: @residential; }
  [type='school']        { polygon-fill: @school; }
  [type='sports_center'] { polygon-fill: @sports; }
  [type='stadium']       { polygon-fill: @sports; }
  [type='university']    { polygon-fill: @school; }
  [type='wood']          { polygon-fill: @wooded; }
}

#landuse_overlays[type='nature_reserve'][zoom>6] {
  line-color: darken(@wooded,25%);
  line-opacity:  0;
  line-dasharray: 1,1;
  polygon-fill: darken(@wooded,25%);
  polygon-opacity: 0;
  [zoom=7] { line-width: 0.4; }
  [zoom=8] { line-width: 0.6; }
  [zoom=9] { line-width: 0.8; }
  [zoom=10] { line-width: 1.0; }
  [zoom=11] { line-width: 1.5; }
  [zoom>=12] { line-width: 2.0; }
}
 
#landuse_overlays[type='wetland'][zoom>11] {
  [zoom>11][zoom<=14] { polygon-pattern-file:url(img/swamp-16.png); }
  [zoom>14] { polygon-pattern-file:url(img/swamp-32.png);}
  }

/* ---- BUILDINGS ---- */
#buildings[zoom>13][zoom<=16] {
  polygon-fill:@building;
  [zoom>13] {
    line-color:darken(@building,5);
    line-width:0.2;
  }
  [zoom>15] {
    line-color:darken(@building,10);
    line-width:0.4;
  }
}
/* At the highest zoom levels, render buildings in fancy pseudo-3D */
#buildings[zoom>=16][type != 'hedge'] {
  building-fill:@building;
  building-height:1.25;
}

#buildings[zoom>=16][type = 'hedge'] {
  building-fill:@wooded;
  building-height:1.25;
}

/* ================================================================== */
/* WATER AREAS
/* ================================================================== */

Map { background-color: @water; }

#water_gen0[zoom>3][zoom<=9],
#water_gen1[zoom>9][zoom<=12],
#water[zoom>12] {
  polygon-fill: @water;
}

/* ================================================================== */
/* WATER WAYS
/* ================================================================== */

#waterway[type='river'][zoom>5] {
  line-color: @water;
  [zoom=6] { line-width: 0.15; }
  [zoom=7] { line-width: 0.25; }
  [zoom=8] { line-width: 0.5; }
  [zoom=9] { line-width: 1; }
  [zoom=10]{ line-width: 1; }
  [zoom>10]{
    line-cap: round;
    line-join: round;
  }
  [zoom=11]{ line-width: 2; }
  [zoom=12]{ line-width: 2; }
  [zoom=13]{ line-width: 3; }
  [zoom=14]{ line-width: 3; }
  [zoom=15]{ line-width: 4; }
  [zoom=16]{ line-width: 5; }
  [zoom=17]{ line-width: 6; }
  [zoom>17]{ line-width: 7; }
}

#waterway[type='stream'][zoom>11] {
  line-color: @stream;
  [zoom=10]{ line-width: 0.5; }
  [zoom=11]{ line-width: 0.5; }
  [zoom=12]{ line-width: 1; }
  [zoom=13]{ line-width: 1; }
  [zoom>13]{
    line-width: 2;
    line-join: round;
    line-cap: round;
  }
}

#waterway[type='canal'][zoom>11] {
  line-color: @canal;
  [zoom=10]{ line-width: 0.5; }
  [zoom=11]{ line-width: 0.5; }
  [zoom=12]{ line-width: 1; }
  [zoom=13]{ line-width: 1; }
  [zoom>13]{
    line-cap: round;
    line-join: round;
  } 
  [zoom=14]{ line-width: 2; }
  [zoom=15]{ line-width: 4; }
  [zoom=16]{ line-width: 8; }
  [zoom=17]{ line-width: 16; }
  [zoom>17]{ line-width: 30; }
}

#waterway[type='ditch'][zoom>14] {
  line-color: @water;
  [zoom=15]{ line-width: .5; }
  [zoom=16]{ line-width: 1; }
  [zoom>16]{ line-width: 2; }
}

/* ================================================================== */
/* ADMINISTRATIVE BOUNDARIES
/* ================================================================== */


#admin[admin_level=2][zoom>1] {
  line-color:@admin_2;
  line-width:0.5;
  [zoom=2] { line-opacity: 0.25; }
  [zoom=3] { line-opacity: 0.3; }
  [zoom=4] { line-opacity: 0.4; }
}

/* ================================================================== */
/* BARRIER POINTS
/* ================================================================== */


#barrier_points[zoom>=17][stylegroup = 'divider'] {
  marker-height: 2;
  marker-fill: #c7c7c7;
  marker-line-opacity:0;
  marker-allow-overlap:true;
}

/* ================================================================== */
/* BARRIER LINES
/* ================================================================== */

#barrier_lines[zoom>=17][stylegroup = 'gate'] {
  line-width:2.5;
  line-color:#aab;
  line-dasharray:3,2;
}

#barrier_lines[zoom>=17][stylegroup = 'fence'] {
  line-width:1.75;
  line-color:#aab;
  line-dasharray:1,1;
}

#barrier_lines[zoom>=17][stylegroup = 'hedge'] {
  line-width:3;
  line-color:darken(@park,5);

}