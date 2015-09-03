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
  poet = \markup{ \fontsize #4 \smallCaps "Have Mercy On Us, God Most High"  }
  meter = \markup { \small { Music: ST. FLAVIAN; \italic "Day's Psalter," 1563 } }
  piece = \markup { \small {Text: F.W. Faber }}
  %breakbefore
  %copyright = ""
  tagline = ""
}

global = {
  \key f \major
  \time 4/4
  %\autoBeamOff
  \set Staff.midiInstrument = "church organ"
}

melody = \relative c' {
  \global
  \partial 4
  f4 |
  f e f a |
  g g f \bar "||"
  f4 |
  bf a f g |
  a2. \bar "||"
  a4 |
  a bf c a |
  f g a \bar "||"
  a |
  g f f e |
  f2. \bar "|."
}

alto = \relative c' {
  \global
  \partial 4
  c4 |
  c c c f |
  f e f
  f |
  f f f e |
  e2.
  f4 |
  f f e e |
  d e f
  f |
  e d d c |
  c2.
}

tenor = \relative c' {
  \global
  \partial 4
  a4 |
  g g a d |
  d c a
  a |
  bf c d d |
  cs2.
  c!4 |
  c bf g a |
  a c c
  c |
  c a g g |
  a2.
}

bass = \relative c {
  \global
  \partial 4
  f4 |
  c c f d |
  bf c f
  f |
  d f bf bf |
  a2.
  f4 |
  f d c c |
  d c f
  f |
  c d bf c |
  f2.
}

verseOne = \lyricmode {
  \set stanza = "1."
  Have mer -- cy on us, God most high,
  Who lift our hearts to Thee;
  Have mer -- cy on us, worms of earth,
  Most ho -- ly Tri -- ni -- ty.
}

verseTwo = \lyricmode {
  \set stanza = "2."
  Most an -- cient of all mys -- ter -- ies,
  Be -- fore Thy throne we lie;
  Have mer -- cy now, most mer -- ci -- ful,
  Most ho -- ly Tri -- ni -- ty.
}

verseThree = \lyricmode {
  \set stanza = "3."
  When heav'n and earth were yet un -- made,
  When time was yet un -- known,
  Thou in Thy bliss and ma -- jes -- ty
  Didst live and love a -- lone.
}

verseFour = \lyricmode {
  \set stanza = "4."
  Thou wert not born; there was no fount
  From which Thy Be -- ing flowed;
  There is no end which Thou canst reach;
  But Thou art sim -- ply God.
}


verseFive = \lyricmode {
  \set stanza = "5."
  How won -- der -- ful cre -- a -- tion is,
  The work which Thou didst bless,
  And O! what then must Thou be like,
  E -- ter -- nal love -- li -- ness!
}

verseSix = \lyricmode {
  \set stanza = "6."
  How beau -- ti -- ful the An -- gels are,
  The Saints how bright in bliss;
  But with Thy beau -- ty, Lord, com -- pared,
  How dull, how poor is this!
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
       tempoWholesPerMinute = #(ly:make-moment 84 4)
            }
       }

  \layout {}
}


%{
No wonder Saints have died of love,
	No wonder hearts can break,
Pure hearts that once have learned to love
	God for His own dear sake.

O listen, then, Most Pitiful!
	To Thy poor creature's heart;
It blesses Thee that Thou art God,
	That Thou art what Thou art!

Most ancient of all mysteries!
	Still at Thy throne we lie;
Have mercy now, most merciful,
	Most holy Trinity!
%}

