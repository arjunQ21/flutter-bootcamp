void main(){
  var list = [1, 2, 3] ;
  
//   list.add(4) ;
  
  int a = 5 ;
  int b = 6 ;
  
  var list2 = [-1, -3, -5] ;
  
  bool toKeepFour = false ;
  
  var extended = [...list,
                  if(toKeepFour)4,
                  ...list2,
                  if(a == 5) "A is 5" else "A is not 5",
                  (b == 6) ? "B is 6" : "B is not 6",
                  for(var i = 0 ; i < 5; i++) i*2,
                  "abc",
                  for(int num in list2) num*2,
                 ] ;
  
  print(extended) ;
  
}
