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
  poet = \markup{ \fontsize #4 \smallCaps "From Heaven Above To Earth I Come"  }
  meter = \markup { \small { Music: VOM HIMMEL HOCH, L.M.; adapt. from Schumann's \italic "Gesangbuch," 1539; adapt. J.S. Bach } }
  piece = \markup { \small {Text: \large \override #'(font-name . "CloisterBlack") "Vom Himmel hoch, da komm ich her," M. Luther, 1535; tr. C. Winkworth }}
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
  \partial 4
  c4 |
  b a b g |
  a b c \bar "||"

  c4 |
  c g \bar "" \break

  g e8[ f] |
  g4 f e \bar "||"

  e4 |
  a a g8[ a] b4 | \break
  c8[ b] a4 g \bar "||"

  c4 |
  b a g a8[ g] |
  f8[ e] d4 c \bar "|."
}

alto = \relative c'' {
  \global
  \partial 4
  g4 |
  g8[ fs] e4 d e8[ d] |
  c4 d e

  e8[ f] |
  g8[ f] d4 d c |
  c d c

  c8[ d] |
  e4 d d8[ fs] g4 |
  g g8[ fs] g4

  e8[ d] |
  d[ e] e[ d] d[ c] c4 |
  c8[ a] b4 c
}

tenor = \relative c' {
  \global
  \partial 4
  e4 |
  d c b c8[ b] |
  a[ g] f4 g

  g4 |
  c c b bf8[ a] |
  g4 g g

  g4 |
  g fs g8[ c] b[ a] |
  g[ b] e[ d] b4

  a4 |
  g g8[ f!] f[ e] a[ b] |
  c4 g8[ f] e4
}

bass = \relative c {
  \global
  \partial 4
  c4 |
  g'4. fs8 g[ f] e4 |
  f8[ e] d4 c

  c8[ d] |
  e4 e8[ f] g4 g8[ f] |
  e[ d] c[ b] c4

  c4 |
  cs d8[ c] b[ a] g4 |
  e'8[ d] c[ d] g4

  g8[ fs] |
  g[ e] c[ d] b[ c] f[ g] a[ f] g[ g,] c4
}

verseOne = \lyricmode {
  \set stanza = "1."
  From heav'n a -- bove to earth I come
  To bear good news to ev -- 'ry home;
  Glad ti -- dings of great joy I bring,
  Where -- of I now will say and sing.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  The Fa -- ther's light and splen -- dour Thou,
  Their end -- less hope to Thee that bow;
  Ac -- cept the prayers and praise to -- day
  That through the world Thy ser -- vants pay.
}

verseThree = \lyricmode {
  \set stanza = "3."
  Sal -- va -- tion's au -- thor, call to mind
  How, tak -- ing form of hu -- man -- kind,
  Born of a Vir -- gin un -- de -- filed,
  Thou in man's flesh be -- cam'st a child.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Thus tes -- ti -- fies the pre -- sent day,
  Through ev -- 'ry year in long ar -- ray,
  That Thou, sal -- va -- tion's source a -- lone,
  Pro -- ceed -- edst from the Fa -- ther's throne.
}

verseFive = \lyricmode {
  \set stanza = "5."
  Whence sky, and stars, and sea's a -- byss,
  And earth, and all that there -- in is,
  Shall still, with laud and ca -- rol meet,
  The Au -- thor of Thine ad -- vent greet.
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
      tempoWholesPerMinute = #(ly:make-moment 72 4)
    }
  }
  \layout {}
}


