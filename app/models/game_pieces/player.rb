module GamePieces
  # maybe this is an avatar?
  class Player < GamePiece
    def emoji_representation
      <<~SVG
<svg
    xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns="http://www.w3.org/2000/svg"
    xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd"
    xmlns:cc="http://creativecommons.org/ns#"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:svg="http://www.w3.org/2000/svg"
    xmlns:ns1="http://sozi.baierouge.fr"
    id="svg2"
    sodipodi:docname="ninja.svg"
    inkscape:export-filename="/home/nicu/Desktop/pacman/pacman.png"
    viewBox="0 0 128 128"
    sodipodi:version="0.32"
    inkscape:export-xdpi="90"
    version="1.0"
    inkscape:output_extension="org.inkscape.output.svg.inkscape"
    inkscape:export-ydpi="90"
    inkscape:version="0.45+devel"
  >
  <defs
      id="defs4"
    >
    <linearGradient
        id="linearGradient2315"
      >
      <stop
          id="stop2317"
          style="stop-color:#000000;stop-opacity:0"
          offset="0"
      />
      <stop
          id="stop2319"
          style="stop-color:#000000;stop-opacity:.57196"
          offset="1"
      />
    </linearGradient
    >
    <filter
        id="filter3730"
        height="1.6817"
        width="1.696"
        y="-.34085"
        x="-.34802"
        inkscape:collect="always"
      >
      <feGaussianBlur
          id="feGaussianBlur3732"
          stdDeviation="5.4650567"
          inkscape:collect="always"
      />
    </filter
    >
    <filter
        id="filter4065"
        height="1.9068"
        width="2.0395"
        y="-.45339"
        x="-.51975"
        inkscape:collect="always"
      >
      <feGaussianBlur
          id="feGaussianBlur4067"
          stdDeviation="4.1511594"
          inkscape:collect="always"
      />
    </filter
    >
    <filter
        id="filter4112"
        height="1.6802"
        width="1.14"
        y="-.34010"
        x="-.070021"
        inkscape:collect="always"
      >
      <feGaussianBlur
          id="feGaussianBlur4114"
          stdDeviation="3.9678331"
          inkscape:collect="always"
      />
    </filter
    >
    <radialGradient
        id="radialGradient2732"
        gradientUnits="userSpaceOnUse"
        cy="506.35"
        cx="210.89"
        gradientTransform="matrix(1.4028 .0000016439 -1.4521e-7 .20588 -89.845 403.11)"
        r="68"
        inkscape:collect="always"
      >
      <stop
          id="stop4074"
          style="stop-color:#000000"
          offset="0"
      />
      <stop
          id="stop4076"
          style="stop-color:#000000;stop-opacity:0"
          offset="1"
      />
    </radialGradient
    >
    <radialGradient
        id="radialGradient2734"
        xlink:href="#linearGradient2315"
        gradientUnits="userSpaceOnUse"
        cy="497.96"
        cx="216.99"
        gradientTransform="matrix(.71580 1.4128 -1.3538 .68592 735.84 -155.77)"
        r="65"
        inkscape:collect="always"
    />
    <radialGradient
        id="radialGradient2736"
        xlink:href="#linearGradient2315"
        gradientUnits="userSpaceOnUse"
        cy="409.86"
        cx="233.5"
        gradientTransform="matrix(.38710 1.5161 -1.4234 .36342 726.51 -93.107)"
        r="15.5"
        inkscape:collect="always"
    />
    <radialGradient
        id="radialGradient3338"
        xlink:href="#linearGradient2315"
        gradientUnits="userSpaceOnUse"
        cy="437.09"
        cx="451.97"
        gradientTransform="matrix(.42555 1.0935 -1.1421 .44444 762.08 -254.34)"
        r="6"
        inkscape:collect="always"
    />
    <radialGradient
        id="radialGradient3373"
        xlink:href="#linearGradient2315"
        gradientUnits="userSpaceOnUse"
        cy="408.81"
        cx="208.35"
        gradientTransform="matrix(1.6314 -4.0417e-7 1.5474e-8 0.0806 -131.55 375.86)"
        r="58.521"
        inkscape:collect="always"
    />
    <radialGradient
        id="radialGradient3375"
        xlink:href="#linearGradient2315"
        gradientUnits="userSpaceOnUse"
        cy="402.71"
        cx="392.24"
        gradientTransform="matrix(1.2438 .39012 -.39366 1.2551 62.891 -255.76)"
        r="3.625"
        inkscape:collect="always"
    />
    <radialGradient
        id="radialGradient3377"
        xlink:href="#linearGradient2315"
        gradientUnits="userSpaceOnUse"
        cy="419.19"
        cx="136.62"
        gradientTransform="matrix(1.2497 .085533 -.092234 1.3476 4.5495 -157.35)"
        r="7.9448"
        inkscape:collect="always"
    />
    <radialGradient
        id="radialGradient3379"
        xlink:href="#linearGradient2315"
        gradientUnits="userSpaceOnUse"
        cy="408.73"
        cx="132.87"
        gradientTransform="matrix(1.217 -.060873 .032773 .65522 -42.232 151.55)"
        r="10.283"
        inkscape:collect="always"
    />
    <radialGradient
        id="radialGradient3386"
        xlink:href="#linearGradient2315"
        gradientUnits="userSpaceOnUse"
        cy="439.6"
        cx="143.81"
        gradientTransform="matrix(1.3772 -.049370 .25496 7.1122 -166.32 -2693.1)"
        r="6.4879"
        inkscape:collect="always"
    />
    <radialGradient
        id="radialGradient3393"
        xlink:href="#linearGradient2315"
        gradientUnits="userSpaceOnUse"
        cy="378.02"
        cx="390.32"
        gradientTransform="matrix(2.01 .000029257 -.00016368 11.274 -394.16 -3889.7)"
        r="3.5355"
        inkscape:collect="always"
    />
  </defs
  >
  <sodipodi:namedview
      id="base"
      inkscape:zoom="0.721875"
      height="640px"
      borderopacity="1.0"
      inkscape:current-layer="layer1"
      inkscape:cx="256"
      inkscape:cy="-20.632199"
      showgrid="false"
      width="128px"
      inkscape:guide-bbox="true"
      showguides="true"
      bordercolor="#666666"
      inkscape:window-x="674"
      guidetolerance="10"
      objecttolerance="10"
      inkscape:window-y="205"
      inkscape:window-width="937"
      inkscape:pageopacity="0.0"
      inkscape:pageshadow="2"
      pagecolor="#ffffff"
      gridtolerance="10000"
      inkscape:document-units="px"
      inkscape:window-height="697"
    >
    <inkscape:grid
        id="grid3194"
        originy="0px"
        originx="0px"
        spacingy="0px"
        spacingx="0px"
        type="xygrid"
    />
  </sodipodi:namedview
  >
  <g
      id="layer1"
      inkscape:label="Layer 1"
      inkscape:groupmode="layer"
      transform="translate(-233.42 -11.735)"
    >
    <g
        id="g2704"
        transform="matrix(.71287 0 0 .71287 152.77 -234.5)"
      >
      <path
          id="rect3388"
          style="fill:#ececec"
          sodipodi:nodetypes="ccccc"
          transform="matrix(1.4028 0 0 1.4028 -403.81 -153.53)"
          d="m390.32 369.87l7.07-9.19v37.48h-7.07v-28.29z"
      />
      <path
          id="path3391"
          sodipodi:nodetypes="ccccc"
          style="fill:url(#radialGradient3393)"
          transform="matrix(1.4028 0 0 1.4028 -403.81 -153.53)"
          d="m390.32 369.87l7.07-9.19v37.48h-7.07v-28.29z"
      />
      <path
          id="rect3381"
          sodipodi:nodetypes="ccccc"
          style="fill:#00003f"
          d="m141.53 401.62h12.97v81.01l-12.97-4.91v-76.1z"
      />
      <path
          id="path3384"
          sodipodi:nodetypes="ccccc"
          style="fill:url(#radialGradient3386)"
          d="m141.53 401.62h12.97v81.01l-12.97-4.91v-76.1z"
      />
      <path
          id="path3361"
          style="fill-rule:evenodd;fill:#ff0000"
          d="m130.66 428.97s14.37-22.44 15.78-13.32c1.4 9.12-11.22 10.52-15.78 13.32z"
      />
      <path
          id="path3369"
          style="fill-rule:evenodd;fill:url(#radialGradient3377)"
          d="m130.66 428.97s14.37-22.44 15.78-13.32c1.4 9.12-11.22 10.52-15.78 13.32z"
      />
      <path
          id="path3363"
          style="fill-rule:evenodd;fill:#ff0000"
          d="m124.82 417.76s26.6-1.73 19.29-7.36c-7.3-5.64-14.63 4.73-19.29 7.36z"
      />
      <path
          id="path2706"
          style="filter:url(#filter4112);fill:url(#radialGradient2732)"
          transform="matrix(1.0588 0 0 .85714 -9.1176 72.48)"
          d="m274 507.36c0 7.73-30.46 14-68 14s-68-6.27-68-14 30.46-14 68-14 68 6.27 68 14z"
      />
      <path
          id="path2708"
          style="fill:#f1e06b"
          sodipodi:nodetypes="cccsssccssc"
          transform="translate(-31,-85)"
          d="m305 531.36c0 4.85-0.53 37.56-1.54 42.11-2.47 12.46-10.48 19.63-22.51 22.36-5.59 1.04-11.95-21.82-18.85-21.95s-14.34 22.48-22.1 22.48c-7.8 0-15.27-22.62-22.2-22.52-6.93 0.11-13.31 22.94-18.91 21.86-12.68-2.1-19.32-10.78-22.44-22.64-0.95-4.42-1.45-37-1.45-41.7 0-35.88 29.12-65 65-65s65 29.12 65 65z"
      />
      <path
          id="path3317"
          style="fill:#2b1100"
          sodipodi:nodetypes="csccsssccsccsscssscc"
          d="m436.84 381.31c-25.57 0-46.34 20.77-46.34 46.35 0 3.34 0.36 26.57 1.03 29.72 2.23 8.45 6.96 14.62 16 16.12 3.99 0.77 8.56-15.49 13.5-15.56 4.94-0.08 10.26 16.03 15.81 16.03 5.54 0 10.83-16.12 15.75-16.03s9.46 16.4 13.44 15.65c8.58-1.94 14.3-7.05 16.06-15.93 0.72-3.24 1.1-26.55 1.1-30 0-25.58-20.77-46.35-46.35-46.35zm26.5 24.07c8.4-0.01 18.06 4.89 18.18 11.91 0.14 7.52-9.53 14.27-17.93 14.27-5.94 0-11.31-3.19-13.81-8.15-2.23 5.62-7.46 9.34-13.87 9.34-8.4 0-30.85-8.16-30.58-14.54 0.19-4.4 21.93-11.62 30.33-11.62 5.94 0 12.06 3.93 14.56 8.91 2.23-5.62 6.71-10.12 13.12-10.12z"
          transform="matrix(1.4028 0 0 1.4028 -403.81 -153.53)"
      />
      <path
          id="path2710"
          sodipodi:nodetypes="cccsssccssc"
          style="fill:url(#radialGradient2734)"
          transform="translate(-31,-85)"
          d="m305 531.36c0 4.85-0.53 37.56-1.54 42.11-2.47 12.46-10.48 19.63-22.51 22.36-5.59 1.04-11.95-21.82-18.85-21.95s-14.34 22.48-22.1 22.48c-7.8 0-15.27-22.62-22.2-22.52-6.93 0.11-13.31 22.94-18.91 21.86-12.68-2.1-19.32-10.78-22.44-22.64-0.95-4.42-1.45-37-1.45-41.7 0-35.88 29.12-65 65-65s65 29.12 65 65z"
      />
      <g
          id="g2712"
          transform="translate(5,10)"
        >
        <path
            id="path2714"
            sodipodi:rx="15.5"
            sodipodi:ry="15.5"
            style="fill:#ffffff"
            sodipodi:type="arc"
            d="m255 417.86a15.5 15.5 0 1 1 -31 0 15.5 15.5 0 1 1 31 0z"
            transform="translate(4,7)"
            sodipodi:cy="417.86218"
            sodipodi:cx="239.5"
        />
        <path
            id="path2716"
            sodipodi:rx="15.5"
            sodipodi:ry="15.5"
            style="fill:url(#radialGradient2736)"
            sodipodi:type="arc"
            d="m255 417.86a15.5 15.5 0 1 1 -31 0 15.5 15.5 0 1 1 31 0z"
            transform="translate(4,7)"
            sodipodi:cy="417.86218"
            sodipodi:cx="239.5"
        />
        <path
            id="path2718"
            sodipodi:rx="15.5"
            sodipodi:ry="15.5"
            style="fill:#000000"
            sodipodi:type="arc"
            d="m255 417.86a15.5 15.5 0 1 1 -31 0 15.5 15.5 0 1 1 31 0z"
            transform="matrix(.61290 0 0 .61290 101.71 169.75)"
            sodipodi:cy="417.86218"
            sodipodi:cx="239.5"
        />
      </g
      >
      <g
          id="g2720"
          transform="translate(-35,10)"
        >
        <path
            id="path2722"
            sodipodi:rx="15.5"
            sodipodi:ry="15.5"
            style="fill:#ffffff"
            sodipodi:type="arc"
            d="m255 417.86a15.5 15.5 0 1 1 -31 0 15.5 15.5 0 1 1 31 0z"
            transform="translate(4,7)"
            sodipodi:cy="417.86218"
            sodipodi:cx="239.5"
        />
        <path
            id="path2724"
            sodipodi:rx="15.5"
            sodipodi:ry="15.5"
            style="fill:url(#radialGradient2736)"
            sodipodi:type="arc"
            d="m255 417.86a15.5 15.5 0 1 1 -31 0 15.5 15.5 0 1 1 31 0z"
            transform="translate(4,7)"
            sodipodi:cy="417.86218"
            sodipodi:cx="239.5"
        />
        <path
            id="path2726"
            sodipodi:rx="15.5"
            sodipodi:ry="15.5"
            style="fill:#000000"
            sodipodi:type="arc"
            d="m255 417.86a15.5 15.5 0 1 1 -31 0 15.5 15.5 0 1 1 31 0z"
            transform="matrix(.61290 0 0 .61290 101.71 169.75)"
            sodipodi:cy="417.86218"
            sodipodi:cx="239.5"
        />
      </g
      >
      <path
          id="path2728"
          style="filter:url(#filter3730);fill-opacity:.62745;fill:#ffffff"
          d="m180.01 413.25c-10.03 10.27-20.41 16.42-23.17 13.72-2.77-2.7 3.13-13.23 13.15-23.5 10.03-10.27 20.41-16.41 23.17-13.71 2.77 2.7-3.13 13.22-13.15 23.49z"
      />
      <path
          id="path2730"
          style="filter:url(#filter4065);fill-opacity:.43439;fill:#ffffff"
          transform="matrix(.77126 .63652 -.63652 .77126 379.12 -54.471)"
          d="m262 501.86c0 7.45-2.46 13.5-5.5 13.5s-5.5-6.05-5.5-13.5 2.46-13.5 5.5-13.5 5.5 6.05 5.5 13.5z"
      />
      <g
          id="g3340"
        >
        <path
            id="path3328"
            style="fill:#999999"
            sodipodi:type="star"
            d="m462.25 443.5l-2.94-3.4-7.31 1.65 3.4-2.94-1.65-7.31 2.94 3.4 7.31-1.65-3.4 2.94 1.65 7.31z"
            sodipodi:r1="7.3527207"
            inkscape:flatsided="false"
            transform="matrix(1.8412 0 0 1.8412 -577.4 -338.48)"
            sodipodi:arg2="1.1053447"
            sodipodi:arg1="0.95449939"
            inkscape:randomized="0"
            sodipodi:cy="437.5"
            sodipodi:cx="458"
            inkscape:rounded="0"
            sodipodi:r2="2.9098985"
            sodipodi:sides="4"
        />
        <path
            id="path3330"
            style="fill:url(#radialGradient3338)"
            sodipodi:type="star"
            sodipodi:sides="4"
            sodipodi:r1="7.3527207"
            sodipodi:r2="2.9098985"
            sodipodi:arg1="0.95449939"
            sodipodi:arg2="1.1053447"
            transform="matrix(1.8412 0 0 1.8412 -577.4 -338.48)"
            inkscape:randomized="0"
            sodipodi:cy="437.5"
            sodipodi:cx="458"
            inkscape:rounded="0"
            inkscape:flatsided="false"
            d="m462.25 443.5l-2.94-3.4-7.31 1.65 3.4-2.94-1.65-7.31 2.94 3.4 7.31-1.65-3.4 2.94 1.65 7.31z"
        />
      </g
      >
      <g
          id="g3344"
          transform="translate(-19.99 5.2605)"
        >
        <path
            id="path3346"
            style="fill:#999999"
            sodipodi:type="star"
            sodipodi:sides="4"
            sodipodi:r1="7.3527207"
            sodipodi:r2="2.9098985"
            sodipodi:arg1="0.95449939"
            sodipodi:arg2="1.1053447"
            transform="matrix(1.8412 0 0 1.8412 -577.4 -338.48)"
            inkscape:randomized="0"
            sodipodi:cy="437.5"
            sodipodi:cx="458"
            inkscape:rounded="0"
            inkscape:flatsided="false"
            d="m462.25 443.5l-2.94-3.4-7.31 1.65 3.4-2.94-1.65-7.31 2.94 3.4 7.31-1.65-3.4 2.94 1.65 7.31z"
        />
        <path
            id="path3348"
            style="fill:url(#radialGradient3338)"
            sodipodi:type="star"
            d="m462.25 443.5l-2.94-3.4-7.31 1.65 3.4-2.94-1.65-7.31 2.94 3.4 7.31-1.65-3.4 2.94 1.65 7.31z"
            sodipodi:r1="7.3527207"
            inkscape:flatsided="false"
            transform="matrix(1.8412 0 0 1.8412 -577.4 -338.48)"
            sodipodi:arg2="1.1053447"
            sodipodi:arg1="0.95449939"
            inkscape:randomized="0"
            sodipodi:cy="437.5"
            sodipodi:cx="458"
            inkscape:rounded="0"
            sodipodi:r2="2.9098985"
            sodipodi:sides="4"
        />
      </g
      >
      <path
          id="rect3356"
          sodipodi:nodetypes="ccccc"
          style="fill:#ff0000"
          d="m154.15 405.83h109.42c4.45 1.31 3.1 3.78 3.16 5.96h-116.79c-0.56-2.97 1.04-4.86 4.21-5.96z"
      />
      <path
          id="path3365"
          sodipodi:nodetypes="ccccc"
          style="fill:url(#radialGradient3373)"
          d="m154.15 405.83h109.42c4.45 1.31 3.1 3.78 3.16 5.96h-116.79c-0.56-2.97 1.04-4.86 4.21-5.96z"
      />
      <path
          id="path3371"
          style="fill-rule:evenodd;fill:url(#radialGradient3379)"
          d="m124.82 417.76s26.6-1.73 19.29-7.36c-7.3-5.64-14.63 4.73-19.29 7.36z"
      />
      <path
          id="path3359"
          sodipodi:rx="3.625"
          sodipodi:ry="3.625"
          style="fill:#ff0000"
          sodipodi:type="arc"
          d="m396.75 404.12a3.625 3.625 0 1 1 -7.25 0 3.625 3.625 0 1 1 7.25 0z"
          transform="matrix(1.4028 0 0 1.4028 -403.81 -154.58)"
          sodipodi:cy="404.125"
          sodipodi:cx="393.125"
      />
      <path
          id="path3367"
          sodipodi:rx="3.625"
          sodipodi:ry="3.625"
          style="fill:url(#radialGradient3375)"
          sodipodi:type="arc"
          d="m396.75 404.12a3.625 3.625 0 1 1 -7.25 0 3.625 3.625 0 1 1 7.25 0z"
          transform="matrix(1.4028 0 0 1.4028 -403.81 -154.58)"
          sodipodi:cy="404.125"
          sodipodi:cx="393.125"
      />
    </g
    >
  </g
  >
  <metadata
    >
    <rdf:RDF
      >
      <cc:Work
        >
        <dc:format
          >image/svg+xml</dc:format
        >
        <dc:type
            rdf:resource="http://purl.org/dc/dcmitype/StillImage"
        />
        <cc:license
            rdf:resource="http://creativecommons.org/licenses/publicdomain/"
        />
        <dc:publisher
          >
          <cc:Agent
              rdf:about="http://openclipart.org/"
            >
            <dc:title
              >Openclipart</dc:title
            >
          </cc:Agent
          >
        </dc:publisher
        >
        <dc:title
          >Game baddie: Ninja</dc:title
        >
        <dc:date
          >2008-02-04T15:07:44</dc:date
        >
        <dc:description
          >Bad guy for arcade games, inspired from the classic Pac-Man: a ninja</dc:description
        >
        <dc:source
          >https://openclipart.org/detail/12566/game-baddie:-ninja-by-nicubunu</dc:source
        >
        <dc:creator
          >
          <cc:Agent
            >
            <dc:title
              >nicubunu</dc:title
            >
          </cc:Agent
          >
        </dc:creator
        >
        <dc:subject
          >
          <rdf:Bag
            >
            <rdf:li
              >arcade</rdf:li
            >
            <rdf:li
              >baddie</rdf:li
            >
            <rdf:li
              >funny</rdf:li
            >
            <rdf:li
              >game</rdf:li
            >
            <rdf:li
              >japanese</rdf:li
            >
            <rdf:li
              >ninja</rdf:li
            >
            <rdf:li
              >warrior</rdf:li
            >
          </rdf:Bag
          >
        </dc:subject
        >
      </cc:Work
      >
      <cc:License
          rdf:about="http://creativecommons.org/licenses/publicdomain/"
        >
        <cc:permits
            rdf:resource="http://creativecommons.org/ns#Reproduction"
        />
        <cc:permits
            rdf:resource="http://creativecommons.org/ns#Distribution"
        />
        <cc:permits
            rdf:resource="http://creativecommons.org/ns#DerivativeWorks"
        />
      </cc:License
      >
    </rdf:RDF
    >
  </metadata
  >
</svg
>
SVG
    end

    def facing_right?
      direction == 'right'
    end

    def facing_left?
      direction == 'left'
    end

    def face(command:)
      command == 'face_right' ? face_right! : face_left!
    end

    def face_right!
      update(direction: 'right')
    end

    def face_left!
      update(direction: 'left')
    end
  end
end
