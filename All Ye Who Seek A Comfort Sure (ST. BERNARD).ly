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
  poet = \markup{ \fontsize #4 \smallCaps "All Ye Who Seek A Comfort Sure"  }
  meter = \markup { \small { Music: ST. BERNARD, C.M., Tochter Sion, 1741; arr. J. Richardson, 1863} }
  piece = \markup { \small {Text: \italic "Quicumque certum quaeritis," 18th cent.; tr. E. Caswall, alt. \italic "The English Hymnal," 1906 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key d \major
  \time 4/4
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c'' {
  \global
  \partial 4
  a4 |
  d, e fs e8[ d] |
  g4 fs e \bar "||"

  a4 |
  fs b gs4. gs8 |
  a2. \bar "||"

  a4 |
  d b a b |
  g g fs \bar "||"

  d |
  g fs e e |
  d2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  d4 |
  d cs d cs8[ d] |
  cs4 d cs

  e |
  d d d4. d8 |
  cs2.

  cs4 |
  d d d b |
  b e d

  d |
  cs d d cs |
  d2.
}

tenor = \relative c {
  \global
  \partial 4
  fs4 |
  a a a a |
  g a a

  a |
  a b b4. b8 |
  a2.

  a4 |
  a g fs fs |
  g a a

  a |
  g a b a8[ g] |
  fs2.
}

bass = \relative c {
  \global
  \partial 4
  d4 |
  fs e d g8[ fs] |
  e4 d a

  cs4 |
  d b e4. e8 |
  a,2.

  a'4 |
  fs g d ds |
  e cs d

  fs |
  e d g, a |
  d2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  All ye who seek a com -- fort sure
  In trou -- ble and dis -- tress,
  What -- ev -- er sor -- row vex the mind,
  Or guilt the soul op -- press,
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Je -- sus, who gave him -- self for you
  Up -- on the Cross to die,
  O -- pens to you His sa -- cred Heart;
  O to that Heart draw nigh.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Ye hear how kind -- ly he in -- vites;
  Ye hear his words so blest
  ‘All ye that la -- bour come to me,
  And I will give you rest.’
}

verseFour = \lyricmode {
  \set stanza = "4."
  O Je -- sus, joy of Saints on high,
  Thou hope of sin -- ners here,
  At -- tract -- ed by those lov -- ing words
  To Thee I lift my prayer.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Wash Thou my wounds in that dear Blood
  Which forth from Thee doth flow;
  New grace, new hope in -- spire, a new
  And bet -- ter heart be -- stow.
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
      tempoWholesPerMinute = #(ly:make-moment 96 4)
    }
  }
  \layout {}
}


