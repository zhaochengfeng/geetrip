//
//  GEWorldListViewController.m
//  Geetrip
//
//  Created by addinghome on 16/1/13.
//  Copyright © 2016年 Geetrip Inc. All rights reserved.
//

#import "GEWorldListViewController.h"
#import "GEHomeNetWorkHelp.h"
#import "DestinationModel.h"
#import "GEDetailViewController.h"

@interface GEWorldListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,strong) UITableView *myTableView;

@end

@implementation GEWorldListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"目的地列表";
    // Do any additional setup after loading the view.
    
    [self loadTableView];
    
}

- (void)loadTableView
{
    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
//    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.myTableView];
    
    [GEHomeNetWorkHelp getDestinationsSuccess:^(id responseObject) {
        NSLog(@"%@",responseObject);
        _dataArray = [DestinationModel getSortedDataArrayWithResponseObject:responseObject];
        NSLog(@"ddd");
        [self.myTableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    DestinationModel *model = [_dataArray objectAtIndex:section];
    return model.child_destinations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseId = @"DestionCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
    }
    DestinationModel *model = [_dataArray objectAtIndex:indexPath.section];
    DestinationChildModel *childModel = [model.child_destinations objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@  %@",childModel.name,childModel.english_name];
    cell.textLabel.textColor = [UIColor darkGrayColor];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    DestinationModel *model = [_dataArray objectAtIndex:section];

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 35)];
    view.backgroundColor = [UIColor backGrayColor];
    
    CGFloat flagWidth = 70 / 47.0 * 15;
    UIImageView *flagView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 10, flagWidth, 15)];
    [flagView sd_setImageWithURL:[NSURL URLWithString:model.nationalFlag]];
    [view addSubview:flagView];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(flagWidth + 20, 0, SCREEN_WIDTH - 40, 35)];
    titleLabel.backgroundColor = [UIColor clearColor];
    
    NSString *text = [NSString stringWithFormat:@"%@ %@",model.name,model.english_name];
    if ([model.english_name isEqual:[NSNull null]] || model.english_name.length == 0) {
        text = model.name;
    }
    
    titleLabel.text = text;
    titleLabel.font = [UIFont systemFontOfSize:15];
    titleLabel.textColor = [UIColor blackColor];
    [view addSubview:titleLabel];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    GEDetailViewController *detial = [[GEDetailViewController alloc] init];
    [self.navigationController pushViewController:detial animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
