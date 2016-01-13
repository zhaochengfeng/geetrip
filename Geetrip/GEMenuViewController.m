//
//  GEMenuViewController.m
//  Geetrip
//
//  Created by chengfeng on 16/1/11.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEMenuViewController.h"
#import "GEUserViewController.h"
#import "GeHomeViewController.h"
#import "GEAboutViewController.h"
#import "GESettingViewController.h"
#import "GESpecialViewController.h"
#import "GEOrderViewController.h"
#import "GEPayInfoViewController.h"
#import "GEFriendsViewController.h"

@interface GEMenuViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIButton *tableHeaderView;
@property (nonatomic,strong) NSArray *tabelArr;

@end

@implementation GEMenuViewController
- (void)viewDidLoad {
    [super viewDidLoad];    
    self.tabelArr = @[@"首页",@"家人和朋友",@"支付信息",@"特别礼遇",@"历史订单",@"设置",@"关于极趣"];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor backGrayColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableHeaderView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    [self.tableHeaderView addTarget:self action:@selector(jumpToUser) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableHeaderView = self.tableHeaderView;
    
    [self.view addSubview:self.tableView];
    
    [self loadHeaderSubViews];
}

- (void)loadHeaderSubViews
{
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 20, SCREEN_WIDTH - 30, self.tableHeaderView.frame.size.height - 20)];
    nameLabel.text = @"未登录";
    [self.tableHeaderView addSubview:nameLabel];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.tableHeaderView.frame.size.height - 0.5, SCREEN_WIDTH, 0.5)];
    lineView.backgroundColor = [UIColor separator_gray_line_color];
    [self.tableHeaderView addSubview:lineView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark ----------------tableView协议--------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tabelArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * const BaoyuCellReuseId = @"baoyucell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BaoyuCellReuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BaoyuCellReuseId];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = self.tabelArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GEHomeViewController *homeVc = [GEHomeViewController defaultHomeManager];
    [self.drawer reloadCenterViewControllerUsingBlock:^{
        
        if (indexPath.row == 0) {
            
        }else if (indexPath.row == 1){
            GEFriendsViewController *frendsVc = [[GEFriendsViewController alloc] init];
            [homeVc.navigationController pushViewController:frendsVc animated:YES];
        }else if (indexPath.row == 2){
            GEPayInfoViewController *info = [[GEPayInfoViewController alloc] init];
            [homeVc.navigationController pushViewController:info animated:YES];
        }else if (indexPath.row == 3){
            GESpecialViewController *spacial = [[GESpecialViewController alloc] init];
            [homeVc.navigationController pushViewController:spacial animated:YES];
        }else if (indexPath.row == 4){
            GEOrderViewController *order = [[GEOrderViewController alloc] init];
            [homeVc.navigationController pushViewController:order animated:YES];
        }else if (indexPath.row == 5){
            GESettingViewController *setting = [[GESettingViewController alloc] init];
            [homeVc.navigationController pushViewController:setting animated:YES];
        }else if (indexPath.row == 6){
            GEAboutViewController *about = [[GEAboutViewController alloc] init];
            [homeVc.navigationController pushViewController:about animated:YES];
        }
    }];
}

- (void)jumpToUser
{
    [self.drawer reloadCenterViewControllerUsingBlock:^{
        
        GEHomeViewController *home = [GEHomeViewController defaultHomeManager];
        GEUserViewController *vc = [[GEUserViewController alloc] init];
        [home.navigationController pushViewController:vc animated:YES];
    }];
}

#pragma mark - ICSDrawerControllerPresenting

- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidOpen:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

- (void)drawerControllerWillClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController
{
    self.view.userInteractionEnabled = YES;
}

@end