//
//  CocoaInitializer.m
//  Car
//
//  Created by Kevin DeMarco on 6/10/14.
//  Copyright (c) 2014 Kevin DeMarco. All rights reserved.
//

#include "CocoaInitializer.h"

#include <AppKit/AppKit.h>
#include <Cocoa/Cocoa.h>

class CocoaInitializer::Private
{
public:
    NSAutoreleasePool* autoReleasePool_;
};

CocoaInitializer::CocoaInitializer()
{
	d = new CocoaInitializer::Private();
	NSApplicationLoad();
	d->autoReleasePool_ = [[NSAutoreleasePool alloc] init];
}

CocoaInitializer::~CocoaInitializer()
{
	[d->autoReleasePool_ release];
	delete d;
}

