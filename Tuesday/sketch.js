var talk = new p5.Speech();
var listen = new p5.SpeechRec;

var bot; 
var a,b,q;

function setup(){
 createCanvas(600,600);
 background(0);
    
b = select('#submit');
q = select('#user');
a = select('#response');
b.mousePressed(chatBot);
    
 bot = new RiveScript();
 bot.loadFile("./brain.rive",botReady,botError);
    
talk = new p5.Speech();
talk.speak("You shall not pass!");
    
    
listen = new p5.SpeechRec();
listen.onResult = showResult;
listen.start();
}

function botReady(){
    bot.sortReplies();
}

function botError(){
}

function chatBot(){
    var question = q.value();
    var reply = bot.reply("local-user", question);
    
    a.value(reply);
    talk.speak(reply);


}

function draw(){
    
fill(random(255),random(255),random(255));
ellipse(mouseX,mouseY,20,20);

}

function showResult(){
    console.log(listen.resultString);
    
    q.value(listen.resultString);
    chatBot();
    
}