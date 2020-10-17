\version "2.20.0"

\include "predefined-ukulele-fretboards.ly"

\header {
  title    = "ԿՌՈՒՆԿ ՀԱՅԱՍՏԱՆԻ"
  composer = "Երաժշտ.՝ ըստ Կոմիտասի"
  arranger = "Version: Ruben Hakhverdyan"
  poet     = "Խօսք՝ Րաֆֆիի"
  tagline  = "Lilypond by Avetik Topchyan, License: CC BY-SA 3.0"
}

global = {
  \time 6/8
  \key c \major
  \tempo 4=80
  \set Staff.stringTunings = #ukulele-tuning
}

chordNames = \chordmode {
  \time 6/8
  \key c \major
  \set Staff.stringTunings = #ukulele-tuning
  c f a d:m g
}

theChords = \chordmode {
  \global
  c2. | c4. f4.   | f4. c4. | f4. c4.  |
  f2. | a4. d:m   | g2.     | g4. c4.  |
  f2. | f4. c     | g2.     | g4. c4.  |

  \repeat volta 2 {
    c2.       | c2.        |
    c4. d4.:m | g4. c4.    |
  }
}

melody = \relative c'' {
  \global
  r8 g g c4 b8 | d c b c a4  |
  a4 b8 c4 a8  | c b a g4.   |
  f4 a8 a4 f8  | g f e f d4  |
  g4 g8 g4 e8  | f e d c4.   |
  f4 a8 a4 b8  | d c a g4 e8 |
  g4 g8 g4 e8  | f e d c4.   | \break

  \repeat volta 2 {
    c'4 e8 e4 e8 | e e f e8. d16 c8 |
    e c e d4.    | d8 b d c4.    |
  }
}

words = \lyricmode {
  Բա -- րով ե -- կար, | սի րուն կը -- ռու -- նկ,   |
  Ի՞նչ լուր բե -- րիր | հայ -- րե -- նի --  քես,   |
  Խօ -- սի'ր ինձ հետ  | ա -- զատ -- օ -- րէ -- էն, |
  Կեան -- քըս կը նը-  | ուի -- րեմ ես քեզ:         |
  Խօ -- սի'ր ինձ հետ  | ա -- զատ -- օ -- րէ -- էն, |
  Կեան -- քըս կը նը-  | ուի -- րեմ ես քեզ:
  \repeat volta 2 {
    Բա -- րով ե -- կար, | սի րուն կը -- ռու -- ու -- ունկ,   |
    Ի՞նչ լուր բե -- րիր | հայ -- րե -- նի --  քես,   |
  }
}


music =
<<
  \new ChordNames { \theChords  }
  \new Staff      {
    \set Staff.instrumentName = "Voice"
    \set Staff.midiInstrument = "voice oohs"
    \melody
  }
  \addlyrics      { \words  }
  \new TabStaff   {
    \set TabStaff.stringTunings = #ukulele-tuning
    \set TabStaff.instrumentName = "Ukulele"
    \set TabStaff.midiInstrument = "acoustic guitar (nylon)"
    \melody
  }
>>

\score {
  <<
    \new ChordNames  \chordNames
    \new FretBoards  \chordNames
  >>
}

\score {
  \music
  \layout{}
}

\score {
  \unfoldRepeats
  \music
  \midi{}
}

\markup {
  \hspace #1
  \column { \line{ "    " } }
  \column {
    \line { 1. Բարով եկար, սիրուն կռունկ, }
    \line { Ի՞նչ լուր բերիր հայրենիքես, }
    \line { Խօսի'ր ինձ հետ ազատօրէն, }
    \line { Կեանքս կը նուիրեմ ես քեզ: }
    \hspace #1
    \line { 2. Տեսա՞ր իմ հայրենեաց տունը, }
    \line { Գեղեցիկ զարդարուած բոյնը, }
    \line { Նորա սիրուն ես տանջւում եմ, }
    \line { Աչքերիաս չի գալիս քունը: }
    \hspace #1
    \line { 3. Ազատ տեսա՞ր մեր լեռները, }
    \line { Հաղորդեցի՞ր դու իմ սէրը, }
    \line { Այն լեռների պաշտպանողը` }
    \line { Առիւծի քաջ կորիւնների: }
    \hspace #1
  }
  \column { \line{ "       " } }
  \column {
    \line { 4; Տեսա՞ր մեր փոքրիկ բուրաստան, }
    \line { Վարդ, մեխակ, շուշաններ շատ կան, }
    \line { Եդեմական դրախտավայր, - }
    \line { Նա կոչւում է Մայր-Հայաստան: }
    \hspace #1
    \line { 5. - Այնտեղ ունիս եղբայր ու քոյր, }
    \line { Միջազ, ի՞նչ կը սպասես իզուր, }
    \line { Արի', առնեմ իմ թևերուն, }
    \line { Գնանք, այնտեղ ուրախացուր: }
    \hspace #1
  }
}


