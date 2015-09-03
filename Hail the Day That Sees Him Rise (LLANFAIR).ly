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
  poet = \markup{ \fontsize #4 \smallCaps "Hail The Day That Sees Him Rise"  }
  meter = \markup { \small { Music: LLANFAIR, 7.4.7.4. D; Welsh, melody by R. Williams; harm. \italic "The English Hymnal" } }
  piece = \markup { \small {Text: Charles Wesley, and T. Cotterill, alt. }}
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
  g4 g b b |
  d c8[ b] a2 |
  d4.( c8 b4) c8[ b] |
  a2 g \bar "||"

  g4 g b b |
  d c8[ b] a2 |
  d4.( c8 b4) c8[ b] |
  a2 g \bar "||"

  b4 b d d |
  e8[ d] c[ b] a2 |
  b4.( a8 b4) cs |
  d2 d \bar "||"

  g,4 g b b |
  d c8[ b] a2 |
  d4.(^\markup {\italic "Voices in unison."}  c8 b4) c8[ b] |
  a2 g \bar "|."
}

alto = \relative c' {
  \global
  d4 d g g |
  g a8[ g] fs2 |
  d4( e8[ fs] g4) g |
  g( fs) g2 \bar "||"

  d4 d g g |
  g a8[ g] fs2 |
  d4( e8[ fs] g4) g |
  g( fs) g2 \bar "||"

  g4 g f f |
  e e fs2 |
  g4.( a8 g4) g |
  fs2 fs \bar "||"

  g4 d d g |
  g a8[ g] fs2 |
  << { \voiceTwo d4 e8[ fs] <d g>4 c8[ d] } \\ { \voiceFour   \once \override NoteColumn #'force-hshift = #1.0 d2 s4  \once \override NoteColumn #'force-hshift = #1.8 g } >> |
  <e g>4 <d fs> d2 \bar "|."
}

tenor = \relative c' {
  \global
  b4 b g g |
  d' e a,2 |
  b4.( c8 d4) c8[ d] |
  e4 d b2 \bar "||"

  b4 b g g |
  d' e a,2 |
  b4.( c8 d4) c8[ d] |
  e4 d b2 \bar "||"

  g4 g a b |
  c c d2 |
  d2. g,4 |
  a2 d \bar "||"

  d4 d8[ c] b4 g |
  d' e a,2 |
  g4. a8 b4 g |
  a2 b \bar "|."
}

bass = \relative c' {
  \global
  g4 g e e |
  b c d2 |
  b'4.( a8 g4) e8[ d] |
  c4( d) g2 \bar "||"

  g4 g e e |
  b c d2 |
  b'4.( a8 g4) e8[ d] |
  c4( d) g2 \bar "||"

  e4 e d d |
  c a d2 |
  g4.( fs8 g4) e |
  d2 d'4( c!) \bar "||"

  b b8[ a] g4 e |
  b c << { \voiceTwo d2 } \\ { \voiceFour \teeny d4_\markup {\italic Org.}  c } >> |
  b4. a8 g4 a8[ b] |
  <c g'>4 <d fs> <g g,>2 \bar "|."
}

verseOne = \lyricmode {
  \set stanza = "1."
  Hail the day that sees Him rise, Al -- le -- lu -- ia!
  To His throne a -- bove the skies, Al -- le -- lu -- ia!
  Christ, a -- while to mor -- tals giv'n, Al -- le -- lu -- ia!
  Re -- as -- cends His na -- tive heav'n, Al -- le -- lu -- ia!

}

verseTwo = \lyricmode {
  \set stanza = "2."
  There the glo -- rious tri -- umph waits, Al -- le -- lu -- ia!
  Lift your heads, e -- ter -- nal gates, Al -- le -- lu -- ia!
  Christ hath con -- quered death and sin, Al -- le -- lu -- ia!
  Take the King of glo -- ry in, Al -- le -- lu -- ia!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Cir -- cled round with an -- gel pow'rs, Al -- le -- lu -- ia!
  Their tri -- um -- phant Lord, and ours, Al -- le -- lu -- ia!
  Con -- qu'ror o -- ver death and sin, Al -- le -- lu -- ia!
  “Take the King of glo -- ry in!” Al -- le -- lu -- ia!

}

verseFour = \lyricmode {
  \set stanza = "4."
  See! the heaven its Lord re -- ceives, Al -- le -- lu -- ia!
  Still He loves the earth He leaves, Al -- le -- lu -- ia!
  Though re -- turn -- ing to His throne, Al -- le -- lu -- ia!
  Still He calls man -- kind His own, Al -- le -- lu -- ia!
}

verseFive = \lyricmode {
  \set stanza = "5."
  Still for us He in -- ter -- cedes,  Al -- le -- lu -- ia!
  His pre -- vail -- ing death he pleads,  Al -- le -- lu -- ia!
  Near Him -- self pre -- pares our place,  Al -- le -- lu -- ia!
  Har -- bing -- er of hu -- man race,  Al -- le -- lu -- ia!
}

verseSix = \lyricmode {
  \set stanza = "6."
  There we shall with Thee re -- main, Al -- le -- lu -- ia!
  Part -- ners of Thy end -- less reign, Al -- le -- lu -- ia!
  There Thy face un -- cloud -- ed see,  Al -- le -- lu -- ia!
  Find our heav'n of heav'ns in Thee!  Al -- le -- lu -- ia!
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
      \context Lyrics = five  \lyricsto sopranos \verseFive
      \context Lyrics = six \lyricsto sopranos \verseSix
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
      tempoWholesPerMinute = #(ly:make-moment 80 4)
    }
  }
  \layout {}
}


%{
\markup {
	\normalsize {
  \fill-line {
    \hspace #0.1 % moves the column off the left margin;
        % can be removed if space on the page is tight
     \column {
      \line { \bold "5. "
		\column {
		"See! He lifts His hands above, Alleluia!"
		"See! He shows the prints of love, Alleluia!"
		"Hark! His gracious lips bestow, Alleluia!"
		"Blessings on His church below, Alleluia!"
      	}
      	}
	\vspace #0.5
		\line { \bold "6. "
		\column {
		"Still for us His death He pleads, Alleluia!"
		"Prevalent He intercedes, Alleluia!"
		"Near Himself prepares our place, Alleluia!"
		"Harbinger of human race, Alleluia!"
		}
		}
	\vspace #0.5
		\line { \bold "7. "
		\column {
		"Master, (will we ever say), Alleluia!"
		"Taken from our head to day, Alleluia!"
		"See Thy faithful servants, see, Alleluia!"
		"Ever gazing up to Thee, Alleluia!"
		}
		}
    	}
    \hspace #0.1  % adds horizontal spacing between columns;
        % if they are still too close, add more " " pairs
        % until the result looks good
     \column {
      \line { \bold "8. "
		\column {
		"Grant, though parted from our sight, Alleluia!"
		"Far above yon azure height, Alleluia!"
		"Grant our hearts may thither rise, Alleluia!"
		"Fol'wing Thee beyond the skies, Alleluia!"
      }
      }
	\vspace #0.5
		\line { \bold "9. "
		\column {
		"Ever upward let us move, Alleluia!"
		"Wafted on the wings of love, Alleluia!"
		"Looking when our Lord shall come, Alleluia!"
		"Longing, gasping after home, Alleluia!"
		}
		}
	\vspace #0.5
		\line { \bold "10. "
		\column {
		"There we shall with Thee remain, Alleluia!"
		"Partners of Thy endless reign, Alleluia!"
		"There Thy face unclouded see, Alleluia!"
		"Find our heav'n of heav'ns in Thee! Alleluia!"
  		}
		}
	}
  \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
  }
}
}

%}