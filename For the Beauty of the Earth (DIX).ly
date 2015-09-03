%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\header {
   poet = \markup{ \fontsize #4 \smallCaps "For the Beauty of the Earth"  }
    meter = \markup { \small { Music: DIX, 77.77.77.; C. Kocher; arr. W.H. Monk, \italic "Hymns Ancient and Modern," 1861} }
    piece = \markup { \small {Text: Folliott S. Pierpoint, 1864 }}
    %breakbefore
    %copyright = ""
    tagline = ""
}

global = {
	\key g \major
	\time 4/4
	\autoBeamOff
	\set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
	\global
	g4 fs8[ g] a4 g |
	c c b2 |
	e,4 fs g e |
	d d d2 \bar "||"

	g4 fs8[ g] a4 g |
	c c b2 |
	e,4 fs g e |
	d d d2 \bar "||"

	b'4^\markup {Refrain} a g b |
	d4. c8 b2 |
	e,4 fs g c |
	b a g2 \bar "|."
}

alto = \relative c' {
	\global
	d4 d d d |
	g d d2 |
	c4 d d c |
	b a b2 \bar "||"

	d4 d d d |
	g d d2 |
	c4 d d c |
	b a b2 \bar "||"

	d4 d d d |
	d d d2 |
	c4 d d c |
	d4. c8 b2 \bar "|."
}

tenor = \relative c' {
	\global
	b4 c8[ b] a4 b |
	c a g2 |
	g4 a g g |
	g fs g2 \bar "||"

	b4 c8[ b] a4 b |
	c a g2 |
	g4 a g g |
	g fs g2 \bar "||"

	g4 d'8[ c] b4 g |
	a fs g2 |
	g4 a g g |
	g fs g2 \bar "|."
}

bass = \relative c' {
	\global
	g4 a8[ g] fs4 g |
	e fs g2 |
	c,4 c b c |
	d d g,2 \bar "||"

	g'4 a8[ g] fs4 g |
	e fs g2 |
	c,4 c b c |
	d d g,2 \bar "||"

	g'4 fs g g |
	fs d g2 |
	c,4 c b e |
	d d g,2 \bar "|."
}

verseOne = \lyricmode {
	\set stanza = "1."
	For the beau -- ty of the earth,
		For the beau -- ty of the skies,
	For the Love which from our birth
		Ov -- er and a -- round us lies:
	\override LyricText #'font-shape = #'italic 
			Christ, our God, to Thee we raise
			This our Sac -- ri -- fice of Praise.  
}

verseTwo = \lyricmode {
	\set stanza = "2."
	For the beau -- ty of each hour
		Of the day and of the night,
	Hill and vale, and tree and flow'r,
		Sun and moon and stars of light:
}

verseThree = \lyricmode {
	\set stanza = "3."
	For the joy of ear and eye,
		For the heart and brain's de -- light,
	For the mys -- tic har -- mo -- ny
		Sink -- ing sense to sound and sight:
}

verseFour = \lyricmode {
	\set stanza = "4."
	For the joy of hu -- man love,
		Bro -- ther, sis -- ter, par -- ent, child,
	Friends on earth, and friends a -- bove;
		For all gent -- le thoughts and mild:
}

\score {
  \context ChoirStaff <<
    \context Staff = upper <<
      \context Voice =
         sopranos { \voiceOne << \melody >> }
      \context Voice =
         altos { \voiceTwo << \alto >> }
      \context Lyrics = one \lyricsto sopranos \verseOne
	  \context Lyrics = two \lyricsto sopranos \verseTwo
	  \context Lyrics = three \lyricsto sopranos \verseThree
	  \context Lyrics = four \lyricsto sopranos \verseFour
    >>
    \context Staff = lower <<
      \clef bass
      \context Voice =
        tenors { \voiceOne << \tenor >> }
      \context Voice =
        basses { \voiceTwo << \bass >> }
    >>
  >>
\midi { 
   \context {
       \Score 
       tempoWholesPerMinute = #(ly:make-moment 88 4)
            }
       }
  \layout {}
}

\markup {
	\large {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "5. "
		\column {
		"For each perfect Gift of Thine"
		"  To our race so freely giv'n,"
		"Graces human and Divine,"
		"  Flow'rs of earth, and buds of Heav'n:"        }
      }
	\vspace #1
      \line { \bold "6. "
		\column {
		"For Thy Bride that evermore"
		"  Lifteth holy hands above,"
		"Off'ring up on ev'ry shore"
		"  This Pure Sacrifice of Love:"        }
      }

    }
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "7. "
		\column {
		"For Thy Martyrs' crown of light,"
		"  For Thy Prophets' eagle eye,"
		"For Thy bold Confessors' might,"
        "For the lips of Infancy:"
		}
      }
	\vspace #1
      \line { \bold "8. "
		\column {
		"For Thy Virgins' robes of snow,"
		"  For Thy Maiden Mother mild,"
		"For Thyself, with hearts aglow,"
		"  Jesu, Victim undefiled,"
		\italic	"Offer we at Thine own Shrine"
	\italic "Thyself, sweet Sacrament Divine."

        }
      }

    }
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}

%{ \markup { 
	\normalsize {
	\fill-line {
	\hspace #1.0
	\column {
		\line { \bold "4. "
		\column {
		"For each perfect Gift of Thine"
		"  To our race so freely giv'n,"
		"Graces human and Divine,"
		"  Flow'rs of earth, and buds of Heav'n:"
		}
		}
		\vspace #0.5
		\line { \bold "5. "
		\column {
		"For Thy Bride that evermore"
		"  Lifteth holy hands above,"
		"Off'ring up on ev'ry shore"
		"  This Pure Sacrifice of Love:"
  		}	
		}
		}
	\hspace #1.0

	}
  }
} %}


