\version "2.20.0"

\header {
  title = "ԾՆՆԴԵԱՆ ՇԱՐԱԿԱՆ ։։ CHRISTMAS HYMN"
}

melody-one = {
 \key g \minor
  \time 4/4
      f bes bes2 \breathe                           
    | bes16( a bes c bes8 a) \breathe g8.( f16 g8 a) 
    | bes2 bes8 ( a bes c                     
    | bes c16 bes a8 bes ) g2 \breathe                
    | a16 ( bes a g a8  bes )  a ( bes16 a g8 a ) \breathe    
    | a16 ( g f g f4 ) bes4. ( a8 ) \breathe
    | bes16  ( a bes c a8 g g ) ( f bes a16 g )   
    | g2 f4. ( a16 g )
    | g2 \breathe g8 ( f g a ) 
    | bes ( c bes a ) g8. ( a16 f4 ) \breathe
    | g4 ( a bes c )
    | a4. ( c8 a bes a g )
    | g2 \breathe a16 ( bes a g a8 bes 
    | a8 bes16 a g8 a ) a16 g ( f g f4 )
    | bes4. ( a8 ) \breathe bes16 ( a bes c a8 g )
    | g16 ( f e f g8 f g4. f8 )
    | d'8.( c16 bes4 a8 g bes a16 g 
    | g2 r )     
}

chorus-one = {
  \key c \major
  \time 3/4
   <c' e,>4 <a f> <b f>  
   <c g>2 <a f>4  
   <b f>2 
   <d f,>4  
   <c e,>2.
}


chorus-two = {
  \key g \minor
  \time 3/4
   <bes' d,>4 <g ees> <a ees>  
   <bes f>2 <g ees>4  
   <a ees>2 
   <c ees,>4  
   <bes d,>2
}

\score {
  <<
  \new Staff { 
    \relative c' { \melody-one } \bar "||"
    \relative c' { \chorus-one } \bar ":|."   
  }
  >>

  \layout{}
  \midi{}
}

