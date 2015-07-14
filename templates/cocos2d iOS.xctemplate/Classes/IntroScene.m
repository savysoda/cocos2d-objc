//
//  ___FILENAME___
//
//  Created by : ___FULLUSERNAME___
//  Project    : ___PROJECTNAME___
//  Date       : ___DATE___
//
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___.
//  All rights reserved.
//
// -----------------------------------------------------------------

#import "IntroScene.h"
#import "HelloWorldScene.h"
#import "Credits.h"

// -----------------------------------------------------------------------

@implementation IntroScene

// -----------------------------------------------------------------------

- (id)init
{
    // Apple recommend assigning self with supers return value
    self = [super init];
    
    // The thing is, that if this fails, your app will 99.99% crash anyways, so why bother
    // Just make an assert, so that you can catch it in debug
    NSAssert(self, @"Whoops");
    
    // get the size of the world
    CGSize size = [CCDirector sharedDirector].viewSize;
    
    // Set the background to medium grey
    self.colorRGBA = [CCColor colorWithRed:0.5 green:0.5 blue:0.5];
    
    // add a solid colored node
    CCSprite9Slice *background = [CCSprite9Slice spriteWithImageNamed:@"white_square.png"];
    background.anchorPoint = CGPointZero;
    background.contentSize = size;
    background.color = [CCColor orangeColor];
    [self addChild:background];
    
    // We need some Hello World stuff
    CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Chalkduster" fontSize:36.0f];
    label.positionType = CCPositionTypeNormalized;
    label.color = [CCColor redColor];
    label.position = ccp(0.5f, 0.5f); // Middle of screen
    [self addChild:label];
    
    // Helloworld scene button
    CCButton *helloWorldButton = [CCButton buttonWithTitle:@"[ Enough Pink ]" fontName:@"Verdana-Bold" fontSize:18.0f];
    helloWorldButton.positionType = CCPositionTypeNormalized;
    helloWorldButton.position = ccp(0.5f, 0.35f);
    [helloWorldButton setTarget:self selector:@selector(onSpinningClicked:)];
    [self addChild:helloWorldButton];

    // Add a sprite
    CCSprite *sprite = [CCSprite spriteWithImageNamed:@"grossini_test.png"];
    sprite.position  = ccp(self.contentSize.width * 0.75,self.contentSize.height * 0.25);
    sprite.scale = 2;
    [self addChild:sprite];
    
    /*
    sprite.effect = [CCEffectDropShadow effectWithShadowOffset:(GLKVector2){10, -10}
                                                   shadowColor:[CCColor colorWithRed:0.5 green:0.3 blue:0.3 alpha:1.0]
                                                    blurRadius:10];
    */
    
    
    // done
	return self;
}

// -----------------------------------------------------------------------

- (void)onEnter
{
    [super onEnter];

    Credits *credits = [Credits creditsWithScene:self];
    [self addChild:credits];
}

// -----------------------------------------------------------------------

- (void)onSpinningClicked:(id)sender
{
    // start spinning scene with transition
    [[CCDirector sharedDirector] replaceScene:[HelloWorldScene new]
                               withTransition:[CCTransition transitionPushWithDirection:CCTransitionDirectionLeft duration:1.0f]];
}

// -----------------------------------------------------------------------

@end























// why not add a few extra lines, so we dont have to sit and edit at the bottom of the screen ...
