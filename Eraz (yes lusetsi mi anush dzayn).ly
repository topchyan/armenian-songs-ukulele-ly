\version "2.20.0"

#(define ukulele-tuning #{ \stringTuning <g c e a> #})
\include "predefined-ukulele-fretboards.ly"

\header {
  title    = "Երազ / Eraz / Dream"
  poet     = "Սմբատ Շահազիզ / Sumbat Shahaziz "
  arranger = "Ukulele Arrangement: Avetik Topchyan"
  composer = "Անանուն / Unknown Composer"
  tagline = \markup {
    
    \line {
      English translation by Z.C.Boyajian (1872-1957).
    }
    \line{
    License: CC-BY-SA 4.0. 
    % Engraved on \simple #(strftime "%Y-%m-%d" (localtime (current-time)))
    % with \with-url #"http://lilypond.org/"
    % \line { LilyPond \simple #(lilypond-version) (http://lilypond.org/) }
    }
  }
}

global = {
  \time 3/4
  \key a \minor
  \tempo 4=80
  \set stringTunings = #ukulele-tuning
}

song = \relative c'' {
  a8 b c4 e  | b8 d c4 a |
  c8 d e4 g | f8 f e2    | \break
  \bar ".|:-||"
  \repeat volta 2 {
    f8 e d4 b  | e8 d c4 a |
    d8 c b4 e, | c'8 b a4 r
  }
  \bar ":|."
}

tabs = {
  <a e c a\4>8   <b e d gis\4>8  <c' a e a\4>4  <e' a e c'\4>4 |
  <b e d gis\4>8 d'              <c' e c a\4>4  a              |
  <c' e c a\4>8 <d' g d g\4> <e' e g c'\4>4  g' |
  <f' b g d'\4>8 f' <e' e\2 c\3 g\4>2   |
  \repeat volta 2 {
    <d'\2 a\3 f'\4>8 <cis'\2 g e'\4> <b f d'\4>4 <aes d b\4>   |
    <e'\1 gis e b\4>8 d' <c' a e a\4>4 <a e c a\4> |
    <f d'>8 <e c'> <d b>4 <e'\1 gis e b\4>   |
    <e c'>8 <d b> <a e c a\4>2
  }
  \bar ":|."
}

chordNames = \chordmode {
  \set Staff.stringTunings = #ukulele-tuning
  a:m e:7 c g d:m
}

theChords = \chordmode {
    \global
    a2.:m  e4:7 a2.:m c2 g4 c2.
    d2:m e4:7 a2:m d4:m e2.:7 a2:m
}

arm = \lyricmode {
  Ես լը -- սե -- ցի      | մի ա ֊նուշ ձայն          |
  Իմ ծե -- րա -- ցած     | մոր մոտ էր               |
  Փայ -- լեց նը -- շույլ | ու -- րա -- խու -- թյան  |
  Բայց ափ -- սո՜ս, որ    | ե -- րազ էր։             |
}

trans = \lyricmode {
  Yes lu -- se -- tsi     | mi a ֊nush dzayn         |
  Im dze -- ra -- tsadz   | mor mot  er              |
  Pay -- lets nu -- shuyl | ou -- ra -- khu -- tyan  |
  Baits ap -- sos, vor    | ye -- raz er             |
}

eng = \lyricmode {
  Soft and low a    | voice breathed o'er me, |
  Near me did my    | mo -- ther seem;        |
  Flashed a ray of  | joy be -- fore me,      |
  But, a -- las, it | was a dream!            |
}

music = <<
  \new ChordNames { \theChords }
  \new Staff {
    \set Staff.instrumentName = "Voice"
    \set Staff.midiInstrument = "voice oohs"
    \new Voice = "melody" {
      \song
    }
  }
  \new Lyrics { \lyricsto "melody" \arm }
  \new Lyrics { \lyricsto "melody" \trans }
  \new Lyrics { \lyricsto "melody" \eng }
  
  \new TabStaff
  {
    \tabFullNotation
    \set TabStaff.stringTunings = #ukulele-tuning
    \set TabStaff.instrumentName = "Ukulele"
    \set TabStaff.midiInstrument = "acoustic guitar (nylon)"
    {
      \tabs
    }
  }
>>

\score {
  <<
    \new ChordNames { \chordNames  }
    \new FretBoards { \chordNames  }
  >>
  \layout { indent = 3\in }
}

\score {
  \music
  \layout {}
}

\score {
  \unfoldRepeats
  \music
  \midi{}
}

\markup {
  %\fill-line {
  
  \hspace #1
  \abs-fontsize #10
  \column {
    \line {
      \bold "2."
      \column {
        " Կարկաչահոս աղբյուր այնտեղ "
        " Թավալում էր մարգարիտ․ "
        " Նա հստակ էր որպես բյուրեղ "
        " Այն երա՜զ էր ցնորամիտ։ "
      }
      \column {
        "  Karkachahos aghbyour ayntegh "
        "  Tavaloum er margarit․ "
        "  Na hstak er vorpes byouregh "
        "  Ayn eraz er tsnoramit։ "
      }
     \column {
       " There the murmuring stream let flowing "
       " Scattered radiant pearls around, "
       " Pure and clear, like crystal glowing - "
       " But it was a dream, unsound. "
      }
    }
    \hspace #1 % adds vertical spacing between verses
    \line {
      \bold "3."
      \column {
        " Եվ մեղեդին տխուր, մայրենի, "
        " Հիշեց մանկության օրեր․  "
        " Մորս համբույրն ես զգացի, "
        " Ա՜խ, ափսո՜ս, որ երազ էր։  "
      }
      \column {
        " Ev meghedin tkhour, mayreni, "
        " Hishets mankoutyan orer․ "
        " Mores hambouyrn es ezgaci, "
        " Akh, apsos, vor eraz er։ "
      }
      \column {
      " And my mother's mournful singing "
      " Took me back to childhood's day, "
      " To my mind her kisses bringing-- "
      " ’Twas a dream and passed away! "
      } 
    }

    \hspace #1 % adds vertical spacing between verses
    \line {
      \bold "4."
      \column {
        " Կրծքին սեղմեց կարոտագին․ "
        " Աչքերս սրբեց, շատ թաց էր, ― "
        " Բայց արտասուքս գնում էին․․․ "
        " Ա՜խ, այդ ինչո՞ւ երազ էր․․․ "
      }
      \column {
        " Krtskin seghmets karotagin․ "
        " Achqers srbets, shat tats er, ―  "
        " Bayc artasouks gnoum eyin․․․ "
        " Akh, ayd inchou eraz er․․․ "
        
      }
      \column {
      " To her heart she pressed me yearning, "
      " Wiped her eyes which wet did seem; "
      " And her tears fell on me burning-- "
      " Why should it have been a dream? "
      }
    }
  }
  %}
}

