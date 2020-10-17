#(define (tie::tab-clear-tied-fret-numbers grob)
   (let* ((tied-fret-nr (ly:spanner-bound grob RIGHT)))
      (ly:grob-set-property! tied-fret-nr 'transparent #t)))

\version "2.20.0"
\paper {
   indent = #0
   print-all-headers = ##t
   print-all-headers = ##t
   ragged-right = ##f
   ragged-bottom = ##t
}
\layout {
   \context { \Score
      \override MetronomeMark.padding = #'5
   }
   \context { \Staff
      \override TimeSignature.style = #'numbered
      \override StringNumber.transparent = ##t
   }
   \context { \TabStaff       
      \override TimeSignature.style = #'numbered
      \override Stem.transparent = ##t
      \override Beam.transparent = ##t
      \override Tie.after-line-breaking = #tie::tab-clear-tied-fret-numbers
   }
   \context { \TabVoice
      \override Tie.stencil = ##f
   }
   \context { \StaffGroup
      \consists "Instrument_name_engraver"
   }
}
deadNote = #(define-music-function (note) (ly:music?)
   (set! (ly:music-property note 'tweaks)
      (acons 'stencil ly:note-head::print
         (acons 'glyph-name "2cross"
            (acons 'style 'special
               (ly:music-property note 'tweaks)))))
   note)

palmMute = #(define-music-function (note) (ly:music?)
   (set! (ly:music-property note 'tweaks)
      (acons 'style 'do (ly:music-property note 'tweaks)))
   note)

TrackAVoiceAMusic = #(define-music-function (inTab) (boolean?)
#{
   \tempo 4=120
   \clef #(if inTab "tab" "treble_8")
   \key c \major
   \time 6/8
   \voiceOne
   <g'\1>4 <fis'\1>8 <g'\1>8 <e'\1>4 
   <d'\1>8. <c'\2>16 <d'\1>8 <e'\1>8 <e'\1>4 
   <g'\1>8 <g'\1>8 <fis'\1>8 <g'\1>8 <e'\1>4 
   \oneVoice
   <d'\1 f\3 >8 <c'\2>8 <d'\1>8 <e'\1 e\2 c\3 g\4 >8 <e'\1>4 
   \voiceOne
   <e'\1>16 <g'\1>16 <e'\1>4 <e'\1>16 <g'\1>16 <e'\1>4 
   <d'\1>8. <c'\2>16 <d'\1>8 <e'\1>8 <e'\1>4 
   <e'\1>16 <g'\1>16 <e'\1>4 <e'\1>16 <a'\1>16 <e'\1>4 
   <d'\1>8 <c'\2>8 <d'\1>8 <e'\1>8 <e'\1>4 
   \oneVoice
   <e'\1>8 <e'\1>8 <c'\4>8 <d'\1>8 <d'\1>8 <b\4>8 
   \voiceOne
   <c'\1>4. <b\1>16 <c'\1>16 <a\1>4 
   <d'\1>8 <d'\1>8 <b\4>8 <c'\1>8 <c'\1>8 <d'\1>8 
   <b\1>4 r4 <b\1>4 
   <c'\1>8 <c'\1>8 <a\1>8 <b\1>8 <b\1>8 <c'\1>8 
   <a\1>4. <a\1>8 <e'\1>4 
   \oneVoice
   <e'\1>8 <e'\1>8 <c'\4>8 <d'\1>8 <d'\1>8 <b\4>8 
   \voiceOne
   <c'\1>4. <b\1>16 <c'\1>16 <a\1>8 \skip 8 
   <d'\1>8 <d'\1>8 <b\4>8 <c'\1>8 <c'\1>8 <d'\1>8 
   <b\1>4. \skip 8 <b\1>4 
   <c'\1>8 <c'\1>16 <b\1>16 <a\2>8 <b\1>8 <b\1>8 <c'\1>8 
   <a\1>4. <a'\1>4. 
   \bar "|."
   \pageBreak
#})
TrackAVoiceBMusic = #(define-music-function (inTab) (boolean?)
#{
   \tempo 4=120
   \clef #(if inTab "tab" "treble_8")
   \key c \major
   \time 6/8
   \voiceTwo
   <e\2 c\3 g\4 >2. 
   <f\3>4. <e\2 c\3 g\4 >4. 
   <e\2 c\3 g\4 >2. 
   \oneVoice
   \skip 8*6 
   \voiceTwo
   <e\2 c\3 g\4 >2. 
   <f\3>4. <e\2 c\3 g\4 >4. 
   <e\2 c\3 g\4 >2. 
   <f\3>4. <b\4 e\3 gis\2 >4. 
   \oneVoice
   \skip 8*6 
   \voiceTwo
   <a\4 c\3 e\2 >2 \skip 4 
   <fis\2 d\3 a\4 >2. 
   <fis\2 d\3 a\4 >4 <a\2>8 <a\4>8 r8 r8 
   <a\4 d\3 f\2 >4. <gis\4 d\3 e\2 >4. 
   <a\4 c\3 e\2 >2. 
   \oneVoice
   \skip 8*6 
   \voiceTwo
   <e\2 c\3 a\4 >8. <a\4>16 <e\2>8 r8 \skip 8 <a\4>8 
   <a\4 d\3 fis\2 >2. 
   <fis\2 d\3 a\4 >4 <a\2>8 <a\4>8 r8 r8 
   <a\4 d\3 f\2 >8 r8 \skip 8 <e\2 d\3 gis\4 >8 \skip 8 \skip 8 
   <e\2 c\3 a\4 >2. 
   \bar "|."
   \pageBreak
#})
TrackALyrics = \lyricmode {
   \set ignoreMelismata = ##t
   

   \unset ignoreMelismata
}
TrackAStaff = \new Staff <<
   \context Voice = "TrackAVoiceAMusic" {
      \TrackAVoiceAMusic ##f
   }
   \context Voice = "TrackAVoiceBMusic" {
      \TrackAVoiceBMusic ##f
   }
>>
TrackATabStaff = \new TabStaff \with { stringTunings = #`(,(ly:make-pitch -1 5 NATURAL) ,(ly:make-pitch -1 2 NATURAL) ,(ly:make-pitch -1 0 NATURAL) ,(ly:make-pitch -1 4 NATURAL) ) } <<
   \context TabVoice = "TrackAVoiceAMusic" {
      \removeWithTag #'chords
      \removeWithTag #'texts
      \TrackAVoiceAMusic ##t
   }
   \context TabVoice = "TrackAVoiceBMusic" {
      \removeWithTag #'chords
      \removeWithTag #'texts
      \TrackAVoiceBMusic ##t
   }
   \new Lyrics \lyricsto "TrackAVoiceAMusic" \TrackALyrics
>>
TrackAStaffGroup = \new StaffGroup <<
   \TrackAStaff
   \TrackATabStaff
>>
\score {
   \TrackAStaffGroup
   \header {
      title = "Hoy Nazan" 
      composer = "Armenian Folk Song" 
      instrument = "Ukulele" 
   }
   \layout{}
   \midi{}
}



