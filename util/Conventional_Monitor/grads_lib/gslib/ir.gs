nshade=99
ishade=36
while (ishade<=nshade)
   i=ishade
   tag=ishade
   red=(i-36)*4
   blue=(i-36)*4
   green=(i-36)*4
   'set rgb 'tag' 'red' 'blue' 'green
   ishade=ishade+1
endwhile

*light yellow to dark red
'set rgb 16 255 250 170'
'set rgb 17 255 232 120'
'set rgb 18 255 192  60'
'set rgb 19 255 160   0'
'set rgb 20 255  96   0'
'set rgb 21 255  50   0'
'set rgb 22 225  20   0'
'set rgb 23 192   0   0'
'set rgb 24 165   0   0'
*light blue to dark blue
'set rgb 25 200 255 255'
'set rgb 26 175 240 255'
'set rgb 27 130 210 255'
'set rgb 28  95 190 250'
'set rgb 29  75 180 240'
'set rgb 30  60 170 230'
'set rgb 31  40 150 210'
'set rgb 32  30 140 200'
'set rgb 33  20 130 190'

'set clevs 195 196 197 198 199 200 201 202 203 204 205 206 207 208 209 210 212 214 216 218 220 222 224 226 228 230 232 234 236 238 240 242 244 246 248 250 252 254 256 258 260 262 264 266 268 270 272 274 276 278 280 282 284 286 288 290 292 294 296 298 300 302 304 306 308 310'
'set ccols 24 23 22 21 20 19 18 17 16 33 32 31 30 29 28 27 26 25 99 98 97 96 95 94 93 92 91 90 89 88 87 86 85 84 83 82 81 80 79 78 77 76 75 74 73 72 71 70 69 68 67 66 65 64 63 62 61 60 59 58 57 56 55 54 53 52 51 50 49 48 47 46 45 44 43 42 41 40 39 38 37 36'