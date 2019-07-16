//
//  ViewController.m
//  doctorCalendar
//
//  Created by Leon on 2019/5/9.
//  Copyright © 2019 Leon. All rights reserved.
//

#import "ViewController.h"
#import "WHUCalendarView.h"
#import "UIMacros.h"
#import "AddNewViewController.h"
@interface ViewController ()
@property (strong, nonatomic) WHUCalendarView *calview;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
@end

@implementation ViewController
//add new
- (IBAction)addNewAction:(id)sender {
    AddNewViewController *addNew = [[AddNewViewController alloc] initWithNibName:@"AddNewViewController" bundle:nil];
    [self.navigationController pushViewController:addNew animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fd_prefersNavigationBarHidden = YES;
    [self createCalendar];
    self.addBtn.backgroundColor = [UIColor blueColor];
    self.addBtn.layer.cornerRadius = 5;
    self.addBtn.layer.masksToBounds = YES;
    [self.addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
}

- (void)createCalendar{
    self.calview = [[WHUCalendarView alloc] initWithFrame:CGRectMake(0, LL_StatusBarHeight, kScreenWidth, kScreenWidth)];
    [self.view addSubview:self.calview];
    
    self.calview.tagStringOfDate=^NSString*(NSArray* calm,NSArray* itemDateArray){
        NSLog(@"%@",calm);
        //如果当前日期中的天数,可以被5整除,显示 预约
        if([itemDateArray[2] integerValue]%5==0){
            return @"就医";
        }
        else{
            return nil;
        }
    };
    
    self.calview.onDateSelectBlk=^(NSDate* date){
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"yyyy年MM月dd"];
        NSString *dateString = [format stringFromDate:date];
        NSLog(@"calview:%@",dateString);
    };
}


@end
