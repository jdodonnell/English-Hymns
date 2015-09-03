%{
The music and poetry produced by this source code are believed to be in the public domain in the United States.
The source code itself is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License:
http://creativecommons.org/licenses/by-nc/4.0/

Musicam Ecclesiae - sites.google.com/site/musicamecclesiae
%}

\version  "2.18.0-1"
\include "english.ly"
\include "hymnstyle.ly"

\paper {
  page-count = 1
}

\header {
  poet = \markup{ \fontsize #4 \smallCaps "When the Patriarch Was Returning"  }
  meter = \markup { \small { Music: ALL SAINTS, 87.87.77.; adapted from \italic "Darmstadt Gesangbuch," 1698 } }
  piece = \markup { \small {Text: \italic "Hoste dum victo triumphans," Cluniac Breviary, 1886; tr. E. Caswall, 1858 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key c \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  c4 g a a |
  g4. f8 e4 c |
  g' a8[ b] c4 b | \break
  a a g2 \bar "||"

  c4 g a a |
  g4. f8 e4 c | \break
  g' a8[ b] c4 b |
  a a g2 \bar "||"

  d'4 d d c8[ d] |  \break
  e4 d8[ c] d2 |
  c4 g a8[ b] c4 |
  d d c2 \bar "|."
}

alto = \relative c' {
  \global
  e4 g f f |
  d b c c |
  d d c d |
  e d b2 |

  e4 g f f |
  d b c c |
  d d c d |
  e d b2 |

  g'4 a g g |
  g g g2 |
  g4 e f g |
  a g8[ f] e2 \bar "|."
}

tenor = \relative c' {
  \global
  g4 c c d |
  g, g g e |
  g fs8[ g] g4 g |
  g fs g2 |

  g4 c c d |
  g, g g e |
  g fs8[ g] g4 g |
  g fs g2 |

  b4 d8[ c] b4 c8[ b] |
  c4 b8[ c] b2 |
  c4 c c c |
  c b c2 \bar "|."
}

bass = \relative c {
  \global
  c4 e f d8[ c] |
  b4 g c c |
  b d8[ g] e4 d |
  c d g,2 |

  c4 e f d8[ c] |
  b4 g c c |
  b d8[ g] e4 d |
  c d g,2 |

  g'4 fs g8[ f] e[ d] |
  c4 g'8[ e] g2 |
  a4 e f a |
  f g c,2 \bar "|."

}

verseOne = \lyricmode {
  \set stanza = "1."
  When the Pa -- triarch was re -- turn -- ing
  Crowned with tri -- umph from the fray,
  Him the peace -- ful king of Sa -- lem
  Came to meet up -- on his way;
  Meek -- ly bear -- ing bread and wine,
  Ho -- ly Priest -- hood's awe -- ful sign.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  On the truth thus dim -- ly sha -- dowed
  La -- ter days a lus -- ter shed;
  When the great high -- Priest e -- ter -- nal,
  Un -- der form of wine and bread,
  For the world's im -- mor -- tal food
  Gave his flesh and gave his blood.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Won -- drous Gift! The Word who fash -- ioned
  All things by his might di -- vine,
  Bread in -- to his bo -- dy chang -- es,
  In -- to his own blood the wine;
  What though sense no change per -- ceives,
  Faith ad -- mires, a -- dores, be -- lieves.
}


verseFour = \lyricmode {
  \set stanza = "4."
  He who once to die a Vic -- tim
  On the cross did not re -- fuse,
  Day by day up -- on our al -- tars,
  That same Sac -- ri -- fice re -- news;
  Through his ho -- ly priest -- hood's hands,
  Faith -- ful to his last com -- mands.
}

verseFive = \lyricmode {
  \set stanza = "5."
  While the peo -- ple all u -- nit -- ing
  In the sac -- ri -- fice sub -- lime
  Of -- fer Christ to his high Fa -- ther,
  Of -- fer up them -- selves with him;
  Then to -- geth -- er with the priest
  On the liv -- ing Vic -- tim feast.
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
      \context Lyrics = five \lyricsto sopranos \verseFive
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
      tempoWholesPerMinute = #(ly:make-moment 84 4)
    }
  }
  \layout {}
}
