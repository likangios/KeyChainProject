//
//  ViewController.m
//  KeyChainProject
//
//  Created by realcloud on 2019/5/15.
//  Copyright © 2019年 realcloud. All rights reserved.
//

#import "ViewController.h"
#import <Security/Security.h>
#import <HappyDNS.h>
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSDateFormatter *formatter;
@property (nonatomic,strong) UITextField *textField;

@end

@implementation ViewController

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewcell"];
    NSString *text = self.dataArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.selected = NO;
    cell.textLabel.text = text;
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.numberOfLines = 0;
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITextField *)textField{
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 50)];
        _textField.keyboardType = UIKeyboardTypeURL;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.text = @"";
    }
    return _textField;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.textField];
    self.dataArray =[NSMutableArray array];
    [self.dataArray addObject:@"hello haha ha"];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 200, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-200)];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewcell"];
    _tableView.delegate = self;
    _tableView.backgroundColor = [UIColor blackColor];
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    _tableView.rowHeight =  UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 20;
    [self.view addSubview:_tableView];
    
    /*
    NSArray *array = @[
     @{"musr":#"<>","mdat":#"2019-05-15 02:00:08 +0000","cdat":#"2019-05-15 02:00:08 +0000","pdmn":"ck","sync":0,"acct":"com.hundsun.hospitalcloud.bj","agrp":"Q545X8957P.com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital","svce":"com.hundsun.hospitalcloud.bj","tomb":0}
     
     ,@{"gena":"Alvin","acct":"","tomb":0,"svce":#"<3c3f786d 6c207665 7273696f 6e3d2231 2e302220 656e636f 64696e67 3d225554 462d3822 3f3e0a3c 21444f43 54595045 20706c69 73742050 55424c49 4320222d 2f2f4170 706c652f 2f445444 20504c49 53542031 2e302f2f 454e2220 22687474 703a2f2f 7777772e 6170706c 652e636f 6d2f4454 44732f50 726f7065 7274794c 6973742d 312e302e 64746422 3e0a3c70 6c697374 20766572 73696f6e 3d22312e 30223e0a 3c646963 743e0a09 3c6b6579 3e633c2f 6b65793e 0a093c64 6174613e 0a092f4a 38434251 7279654c 46436c42 50506e61 584d322f 34565147 6173666b 6a465870 2f314f67 5553496d 383d0a09 3c2f6461 74613e0a 3c2f6469 63743e0a 3c2f706c 6973743e 0a>","desc":"","musr":#"<>","pdmn":"ak","cdat":#"2019-05-15 02:00:08 +0000","sync":0,"mdat":#"2019-05-15 02:00:08 +0000","agrp":"Q545X8957P.com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital","labl":""},
     @{"musr":#"<>","mdat":#"2019-05-15 09:42:15 +0000","cdat":#"2019-05-15 02:00:12 +0000","pdmn":"ak","acct":"unicode","sync":0,"agrp":"Q545X8957P.com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital","svce":"com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital.session","tomb":0},
     
     @{"musr":#"<>","mdat":#"2019-05-15 09:42:15 +0000","cdat":#"2019-05-15 02:00:12 +0000","pdmn":"ak","acct":"timelag","sync":0,"agrp":"Q545X8957P.com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital","svce":"com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital.session","tomb":0},
     
     @{"musr":#"<>","mdat":#"2019-05-15 08:01:40 +0000","acct":"MTA.EventIndex.Key","pdmn":"ck","sync":0,"cdat":#"2019-05-15 08:01:40 +0000","agrp":"Q545X8957P.com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital","svce":"MTA.EventIndex.Key","tomb":0},
     
     @{"musr":#"<>","mdat":#"2019-05-15 09:42:24 +0000","cdat":#"2019-05-15 09:42:24 +0000","pdmn":"ak","acct":"accessToken","sync":0,"agrp":"Q545X8957P.com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital","svce":"com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital.session","tomb":0},
     
     @{"musr":#"<>","mdat":#"2019-05-15 09:42:24 +0000","cdat":#"2019-05-15 09:42:24 +0000","pdmn":"ak","acct":"refreshToken","sync":0,"agrp":"Q545X8957P.com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital","svce":"com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital.session","tomb":0}];
    
    */
    /*
     acct:
    com.hundsun.hospitalcloud.bj  com.hundsun.hospitalcloud.bj
    unicode     com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital.session
    timelag     com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital.session
     MTA.EventIndex.Key  MTA.EventIndex.Key
     accessToken com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital.session
     refreshToken com.hundsun.hospitalcloud.bj.unionmedicalcollegeHospital.session
     */
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    NSMutableArray *array = [[NSMutableArray alloc] init];
//    [array addObject:[QNResolver systemResolver]];
    [array addObject:[[QNResolver alloc] initWithAddress:@"114.114.114.114"]];
    [array addObject:[[QNResolver alloc] initWithAddress:@"223.5.5.5"]];
    [array addObject:[[QNResolver alloc] initWithAddress:@"223.6.6.6"]];
    QNDnsManager *dns = [[QNDnsManager alloc] init:array networkInfo:[QNNetworkInfo normal]];
    CFAbsoluteTime startTime =CFAbsoluteTimeGetCurrent();
    NSArray *ips = [dns query:self.textField.text.length?self.textField.text:@"xh2.hsyuntai.com"];
    CFAbsoluteTime linkTime = (CFAbsoluteTimeGetCurrent() - startTime);
    NSLog(@"Linked in %f ms", linkTime *1000.0);
    NSLog(@"ips:%@",ips);
    NSString *content = [NSString stringWithFormat:@"%@:Linked in %f ms \n ips:%@\n",[self nowDateString],linkTime *1000.0,ips];
    [self.dataArray addObject:content];
    [self.tableView  insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
//    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.dataArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];

}
- (NSDateFormatter *)formatter{
    if (!_formatter) {
        _formatter = [[NSDateFormatter alloc]init];
        [_formatter setDateFormat:@"YYYY-MM-DD hh:mm:sss"];
    }
    return _formatter;
}
- (NSString *)nowDateString{
    return [self.formatter stringFromDate:[NSDate date]];
}

@end
