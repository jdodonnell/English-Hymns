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
  poet = \markup{ \fontsize #4 \smallCaps "Ye Watchers and Ye Holy Ones"  }
  meter = \markup { \small { Music: LASST UNS ERFREUEN, 88.44.88. \tiny "w. Alleluias"; \italic "Geistliche Kirchengesäng;" harm. R. Vaughan Williams } }
  piece = \markup { \small {Text: J.A. Riley, 1906 }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key ef \major
  \time 3/2
  \autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 2
  ef2^\markup { \italic "Unison." } |
  ef4 f g ef g af |
  <f bf>1 ef2 |
  ef4 f g ef g af |
  <f bf>1 \bar "||"

  ef'4^\markup { \italic Harmony. } d |
  c2 bf ef4 d |
  c2 bf\fermata \bar "||"

  ef2^\markup { \italic Unison. } |
  ef4 bf bf af g af |
  <f bf>1 ef'2 |
  ef4 bf bf af g af |
  bf1 \bar "||"

  af4^\markup { \italic Harmony. } g |
  f2 ef af4 g |
  f2 ef ef'4 d |
  c2 bf ef4^\markup { \italic Unison. } d |
  c2 bf af4 g |
  f1. |
  ef1 \bar "|."
}

alto = \relative c' {
  \global
  \partial 2
  bf2 |
  ef1 ef2 |
  ef d ef |
  bf4 d ef2 ef |
  ef d
  bf'4 bf |
  bf( af) g2 ef4 f |
  g( f) d2

  bf'4 af |
  g2~ g4 f ef2
  ef d << \ignore {\voiceTwo bf'2}\\{\voiceTwo ef,4 f}>> |
  <ef bf'> <d af'> <ef g> ef2. |
  ef4 d g f
  ef4 ef |
  ef( d) ef2 ef4 ef |
  ef( d) c2 g'4 f|
  g( f) d2
  <g bf>2~ |
  <g bf>4 <f af>~ <f af> <c g'> c ef |
  ef2 d1 |
  bf
}

tenor = \relative c' {
  \global
  \partial 2
  g2 |
  g4 af bf g c2 |
  bf1 bf4 c |
  bf af bf2 c
  bf1

  ef4 ef |
  ef2 ef g,4 bf |
  bf( a) bf2
  ef2
  ef~ ef4 bf bf af |
  f2 bf bf |
  bf~ bf4 ef d c |
  bf1
  c4 c |
  c( bf) bf2 c4 bf |
  c( af) g2 g4 bf |
  bf( a) bf2 <g bf>~ |
  g4 af f g af bf |
  c2 bf af |
  g1
}

bass = \relative c {
  \global
  \partial 2
  ef2 |
  ef~ ef4 ef8[ d] c4 f |
  bf,2 bf'4 af g af |
  g f ef d c f
  bf,2 bf'4 af
  g g |
  af2 ef c4 d |
  ef( f) bf,2\fermata
  g'4 f |
  ef d c d ef c |
  bf2 bf'4 af g af |
  g f ef c' bf af |
  g f ef d
  c4 bf |
  af 2 g f4 g |
  af( bf) c2 c4 d |
  ef( f) bf,2 c4 d |
  ef f d e f g |
  af2 bf bf, |
  << \ignore {\voiceTwo \tiny ef,1}\\{ef'1}>>
}

verseOne = \lyricmode {
  \set stanza = "1."
  Ye watch -- ers and ye ho -- ly ones,
  Bright Se -- raphs, Che -- ru -- bim and Thrones,
  Raise the glad strain, Al -- le -- lu -- ia!
  Cry out Do -- min -- ions, Prince -- doms, Pow'rs,
  Vir -- tues, Arch -- an -- gels, An -- gels' choirs,
}

verseTwo = \lyricmode {
  \set stanza = "2."
  O high -- er than the Che -- ru -- bim,
  More glo -- rious than the Se -- ra -- phim,
  Lead their prais -- es, Al -- le -- lu -- ia!
  Thou Bear -- er of the_e -- ter -- nal Word,
  Most gra -- cious, mag -- ni -- fy the Lord,
  \override LyricText.extra-offset = #'(0 . -1.2)
  \override LyricExtender.extra-offset = #'(0 . -1.2)
  \override LyricHyphen.extra-offset = #'(0 . -1.2)
  Al -- le -- lu -- ia, Al -- le -- \override LyricText.extra-offset = #'(0 . 0)
  \override LyricExtender.extra-offset = #'(0 . 0)
  \override LyricHyphen.extra-offset = #'(0 . 0) lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia, Al -- le -- lu -- ia!
}

verseThree = \lyricmode {
  \set stanza = "3."
  Re -- spond, ye souls in end -- less rest,
  Ye Pa -- tri -- archs and Pro -- phets blest,
  Al -- le -- lu -- ia, Al -- le -- lu -- ia!
  Ye ho -- ly Twelve, ye Mar -- tyrs strong,
  All Saints tri -- um -- phant, raise the song

}

verseFour = \lyricmode {
  \set stanza = "4."
  O friends, in glad -- ness lt us sing,
  Su -- per -- nal an -- thems ech -- o -- ing,
  Al -- le -- lu -- ia, Al -- le -- lu -- ia!
  To God the Fa -- ther, God the Son,
  And God the Spir -- it, Three in One,
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
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
  \layout {}
}


