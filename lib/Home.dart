import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

var grid=[
  '-','-','-',
  '-','-','-',
  '-','-','-'
];
var winner='';
 var currentplayer = 'X';
 void drawxo(i){
if(grid[i]=='-'){
   setState(() {
     grid[i]=currentplayer;
     currentplayer = currentplayer =='X' ? 'O':'X';
   });

   findwinner(grid[i]);
}
 }

 bool checkmove(i1,i2,i3,sign){
 
   if(grid[i1] == sign && grid[i2] == sign && grid[i3] == sign){
    return true;
   }
   return false;

 }

   void findwinner(currentsign){

    if(checkmove(0,1,2,currentsign)|| checkmove(3,4,5,currentsign) || checkmove(6,7,8,currentsign)||
       checkmove(0,3,6,currentsign)|| checkmove(1,4,7,currentsign) || checkmove(2,5,8,currentsign)||
       checkmove(0,4,8,currentsign)|| checkmove(2,4,6,currentsign)
       

    ){

      setState(() {
        winner = currentsign;
       
      });
      
    }

   }

 void reset(){
  setState(() {
    winner = '';
    grid=[
  '-','-','-',
  '-','-','-',
  '-','-','-'
];
  });
 }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
       darkTheme: ThemeData.dark(),
    title: 'Tic Tac Toe',
        theme: ThemeData(primarySwatch: Colors.amber),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Tic Tac Toe'),
          ),
          
          body: Center(
            child: Column(
              children: [
                if(winner!= "")Text('$winner won the game',style: TextStyle(fontSize: 20),),
                Container(
                  constraints: BoxConstraints(maxWidth: 300,maxHeight: 400),
                  margin: EdgeInsets.all(20),
                  color: Colors.black,
                  child: GridView.builder(
                    shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemCount: grid.length,
                      itemBuilder: (context, index) => Material(
                        color: Color.fromARGB(255, 15, 169, 180),
                        child: InkWell(
                          splashColor: Colors.amber,
                          onTap: ()=>drawxo(index),
                          child: Center(
                              child: Text(grid[index], style: TextStyle(fontSize: 50),
                              )
                          ),
                        ),
                      )
                   ),
                ),
                            
                ElevatedButton.icon(onPressed: reset, 
                icon: Icon(Icons.refresh), 
                label: Text('Play Again') )
              ],
            ),
          ),
        ));
  }
}