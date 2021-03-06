#include "ofApp.h"
#include "boost/utility.hpp"


int prevPosX = 0;
int prevPosY = 0;
int sizeBox = 10;
int speed = 30;
int delta = 0;

int red = 0;
int green = 0;
int blue = 0;
list<ofPoint> boxes = list<ofPoint>();
ofColor c1,c2;

//--------------------------------------------------------------
void ofApp::setup(){
    
    ofColor colorOne;
    ofColor colorTwo;
    c1.set(50,50,50);
    c2.set(100,100,100);
    ofSetLineWidth(5.0f);
}

//--------------------------------------------------------------
void ofApp::update(){
    if(delta<0){
        red = int(ofRandom(255));
        green = int(ofRandom(255));
        blue = int(ofRandom(255));
        delta = speed;
    }
    delta--;
}

//--------------------------------------------------------------
void ofApp::draw(){
    ofBackgroundGradient(c2, c1, OF_GRADIENT_CIRCULAR);

    for (list<ofPoint>::const_iterator it = boost::next(boxes.begin()); it != boxes.end(); ++it) {
        
        if(delta<0){
            ofSetColor(red, green, blue);
        }
        ofFill();
        
        ofDrawLine(boost::prior(it)->x, boost::prior(it)->y, it->x, it->y);
        
        ofDrawLine(ofGetWidth() - boost::prior(it)->x, boost::prior(it)->y, ofGetWidth()- it->x, it->y);
        ofDrawLine(boost::prior(it)->x, ofGetHeight() - boost::prior(it)->y, it->x,ofGetHeight() - it->y);
        ofDrawLine(ofGetWidth() - boost::prior(it)->x, ofGetHeight() - boost::prior(it)->y, ofGetWidth() - it->x, ofGetHeight() -it->y);
    }
}

//--------------------------------------------------------------
void ofApp::exit(){

}

//--------------------------------------------------------------
void ofApp::touchDown(ofTouchEventArgs & touch){
    prevPosY = mouseY;
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){
    boxes.push_back(ofPoint(mouseX, mouseY));
}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){
//    if(mouseY-prevPosY<0){
//        speed+=1;
//    }else{
//       speed-=1;
//    }
//    prevPosY = mouseY;
//    
//    ofLog() << speed << "speed";
}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){
    //sizeBox += 10;
    boxes = list<ofPoint>();
}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){
    
}

//--------------------------------------------------------------
void ofApp::lostFocus(){

}

//--------------------------------------------------------------
void ofApp::gotFocus(){

}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){

}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
}

