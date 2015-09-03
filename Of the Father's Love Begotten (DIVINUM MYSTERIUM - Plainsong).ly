
\version "2.18.0"
\include "english.ly"
\include "hymnstyle.ly"

\header {
  poet = \markup{ \fontsize #4 \smallCaps "Of the Father's Love Begotten"  }
  meter = \markup { \small { Music: DIVINUM MYSTERIUM, 87.87.87.7; 13th Cent. Plainsong, Mode V; harm. W. Douglas, 1916 } }
  piece = \markup { \small {Text: \italic"Corde natus ex parentis," Prudentius; tr. J.M. Neale, 1854, and H.W. Baker, 1859  }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key ef \major
  \cadenzaOn
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}


melody = \relative c' {
  \global
  ef8^\markup {\italic "To be sung in unison."} f g af g f g[ f] ef4 \divisioMinima \bar ""
  g8 af bf c bf[ g] af bf4 \divisioMaior \bar "" \break
  c8 d ef bf bf af g[ f] ef4 \divisioMinima \bar ""
  c8 d ef f ef[ c] d ef4 \divisioMaior \bar "" \break
  ef8 f g af g f bf[( c] bf[ g af]) bf4 \divisioMinima \bar ""
  ef,8 d c d \bar "" \break
  ef c bf4 \divisioMaior \bar ""

  ef8 f g bf g ef f4( ef) \bar "||"

  ef8[ f ef] d4( ef) \bar "|."
}

alto = \relative c' {
  \global
  ef2~ ef8[ d] ef4~ ef
  ef2~ ef4 f8~ f4
  ef8[ f] ef2 d4 ef
  g,4. af8 g4 bf8~ bf4
  ef2~ ef4~ ef4~ ef4.~ ef4
  bf4 af g8[ af] f4

  bf4 ef d8[ ef] c[ d] bf4

  bf4.~ bf2
}

tenor = \relative c' {
  \global
  g8[ af bf c] bf4~ bf8[ af] g4
  bf4. af8 bf4 c8 d4
  c8[ af] bf4~ bf8[ c] bf[ af] g4
  ef c~ c8[ ef f] g4
  g8[ af bf c] bf8[ af] g4~ g8[ ef f] g4
  ef4~ ef4~ ef4 d
  g bf4~ bf8[ g] f4 g

  g4. f4 g
}

bass = \relative c {
  \global
  ef4. af,8 bf4 ef2
  ef8[ f g af] g4 f8 bf,4
  af'8[ f] g4 g,8[ af] bf4 c
  c4~ c8[ f,] c'4 d8 ef4
  ef4. af,8 ef'4~ ef ef,4.~ ef4
  g4 af8[ bf] c[ af] bf4
  ef, ef'8[ g,] bf[ c] af[ bf] ef4

  ef4. bf4 ef,
}


verseOne = \lyricmode {
  \set stanza = "1."
  Of the Fa -- ther’s love be -- got -- ten,
  Ere the worlds be -- gan to be,
  He is Al -- pha and O -- me -- ga,
  He the source, the end -- ing He,
  Of the things that are, that have been,
  And that fu --  ture years shall see,
  \override Lyrics . LyricText #'font-shape = #'italic Ev -- er -- more and ev -- er -- more!
  A -- men.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  At His Word the worlds were fram -- èd;
  He com -- mand -- ed; it was done:
  Heav'n and earth and depths of o -- cean
  In their three -- fold or -- der one;
  All that grows be -- neath the shin -- ing
  Of the moon and burn -- ing sun,
}

verseThree = \lyricmode {
  \set stanza = "3."
  He is found in hu -- man fash -- ion,
  Death and sor -- row here to know,
  That the race of Ad -- am’s chil -- dren
  Doomed by law to end -- less woe,
  May not hence -- forth die and per -- ish
  In the dread -- ful gulf be -- low,
}

verseFour = \lyricmode {
  \set stanza = "4."
  O that birth for -- ev -- er bles -- sèd,
  When the vir -- gin, full of grace,
  By the Ho -- ly Ghost con -- ceiv -- ing,
  Bare the Sav -- iour of our race;
  And the Babe, the world’s Re -- deem -- er,
  First re -- vealed His sac -- red face,
}


\score {
  \new ChoirStaff <<
    \new Staff  <<
      \new Voice = "soprano" { \voiceOne \melody }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics  \lyricsto soprano \verseOne
    \new Lyrics  \lyricsto soprano \verseTwo
    \new Lyrics  \lyricsto soprano \verseThree
    \new Lyrics \lyricsto soprano \verseFour
    \new Staff  <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
  >>
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 60 4)
    }
  }
  \layout { }
}

\markup {
  \large{
    \fill-line {
      \hspace #0.1 % moves the column off the left margin;
      % can be removed if space on the page is tight
      \column {
        \line {
          \bold "5. "
          \column {
            "O ye heights of heaven adore Him;"
            "  Angel hosts, His praises sing;"
            "Powers, dominions, bow before Him,"
            "  and extol our God and King!"
            "Let no tongue on earth be silent,"
            "  Every voice in concert sing,"
          }
        }
        \vspace #1
        \line {
          \bold "6. "
          \column {
            "This is He Whom seers in old time"
            "  Chanted of with one accord;"
            "Whom the voices of the prophets"
            "  Promised in their faithful word;"
            "Now He shines, the long expected,"
            "  Let creation praise its Lord,"
          }
        }
      }
      \hspace #0.1  % adds horizontal spacing between columns;
      % if they are still too close, add more " " pairs
      % until the result looks good
      \column {
        \line {
          \bold "7. "
          \column {
            "Righteous judge of souls departed,"
            "  Righteous King of them that live,"
            "On the Father’s throne exalted"
            "  None in might with Thee may strive;"
            "Who at last in vengeance coming"
            "  Sinners from Thy face shalt drive,"
          }
        }
        \vspace #1
        \line {
          \bold "8. "
          \column {
            "Thee let old men, thee let young men,"
            "  Thee let boys in chorus sing;"
            "Matrons, virgins, little maidens,"
            "  With glad voices answering:"
            "Let their guileless songs re-echo,"
            "  And the heart its music bring,"
          }
        }
      }
      \hspace #0.1 % gives some extra space on the right margin;
      % can be removed if page space is tight
    }
  }
}


\markup \fill-line {
  \center-column 	{
    \large {
      \vspace #1.5
      \column {
        \line {
          \bold "9. "
          \column {
            "Christ, to Thee with God the Father,"
            "  And, O Holy Ghost, to Thee,"
            "Hymn and chant with high thanksgiving,"
            "  And unwearied praises be:"
            "Honour, glory, and dominion,"
            "  And eternal victory,"
          }
        }
        \hspace #1.0
      }
    }
  }
}
