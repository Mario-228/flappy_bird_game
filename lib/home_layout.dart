import 'dart:async';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}
GlobalKey<DrawerControllerState> drawerKey=GlobalKey<DrawerControllerState>();
class _HomeLayoutState extends State<HomeLayout> {
  static double yAxisAlignment=0;
  double initialHeight=yAxisAlignment;
  double time=0;
  double height=0;
  bool gameStart=false;
  static double barrierOne =2;
  double barrierTwo= barrierOne + 1.5;
  double size=0;
  int score=0;
  int bestScore=0;
 void jump()
 {
  setState(() 
  {
    time=0;
    initialHeight=yAxisAlignment;
  });
 }

 void startGame()
 {
  Timer.periodic(
    const Duration(milliseconds: 50),
     (timer) 
     {
      gameStart=true;
      time+=0.04;
      height=-4.9*time*time+2.8*time;
     setState(() 
     {
     yAxisAlignment=initialHeight - height;
     if(barrierOne<-1.1 || barrierTwo<-1.1)
     {
        score++;
        if(score>=bestScore)
        {
          bestScore=score;
        }
     }
     if(barrierOne<-1.1)
     {
      // size+=0.005;
      barrierOne+=2.2;
     }
     else
     {
      barrierOne-=0.05;
     }
     if(barrierTwo<-1.1)
     {
      // size+=0.005;
      barrierTwo+=2.2;
     }
     else
     {
      barrierTwo-=0.05;
     }
     });
     if(yAxisAlignment>=1 || yAxisAlignment<=-1 )
     {
      timer.cancel();
      gameStart=false;
     }
     }
     );
 }
 
  @override
  Widget build(BuildContext context) 
  {
    return  Scaffold(
      backgroundColor: Colors.blue,
      body: GestureDetector(
        onTap: ()
        {
          if(gameStart)
          {
            jump();
          }
          else
          {
            startGame();
          }
        },
        child: Column(
          children: 
          [
            Expanded(
              flex: 3,
              child: 
              Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(
                      microseconds: 0,
                    ),
                    alignment:  Alignment(-1,yAxisAlignment),
                    color: Colors.blue,
                    child: bird(),
                  ),
                AnimatedContainer(
                duration:const Duration(milliseconds: 0),
                alignment:  Alignment(barrierOne,1.1),
                child:barrier(200.0+size),
              ),
                AnimatedContainer(
                duration:const Duration(milliseconds: 0),
                alignment:  Alignment(barrierOne,-1.3),
                child:barrier(200.0+size),
              ),
                AnimatedContainer(
                duration:const Duration(milliseconds: 0),
                alignment:  Alignment(barrierTwo,1.2),
                child:barrier(150.0+size),
              ),
                AnimatedContainer(
                duration:const Duration(milliseconds: 0),
                alignment:  Alignment(barrierTwo,-1.2),
                child:barrier(250.0+size),
              ),
                ],
              )
              ),
               Container(
                color: Colors.amber,
                height: 10.0,
              ),
              Expanded(
              child: Container(
                color: Colors.brown,
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Score",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 30.0),),
                        const SizedBox(height: 5.0,),
                        Text(score.toString(),style:const TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 30.0),),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text("Best",style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 30.0),),
                       const SizedBox(height: 5.0,),
                        Text(bestScore.toString(),style:const TextStyle(color: Colors.amber,fontWeight: FontWeight.bold,fontSize: 30.0),),
                      ],
                    )
                  ],
                ),
              )
              )
          ],
        ),
      ),
    );
  }
}

Widget bird()=>  
           const Image(
            image: AssetImage("image/Flappy-Bird-PNG-Pic.png"),
            height: 80.0,
            width: 80.0,
            );

Widget barrier(double size)=>
        Container(
          width: 100,
          height: size,
          decoration: const BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0)
            )
          ),
        );