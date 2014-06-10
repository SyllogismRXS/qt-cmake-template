//
//  Car.m
//  Car
//
//  Created by Kevin DeMarco on 6/10/14.
//  Copyright (c) 2014 Kevin DeMarco. All rights reserved.
//

#import "Car.h"

Car::Car()
{
    odometer_ = 0;
}

int Car::odometer()
{
    return odometer_;
}

void Car::gas()
{
    odometer_++;
}