//
//  GeHomeViewController.m
//  Geetrip
//
//  Created by chengfeng on 15/7/12.
//  Copyright (c) 2015年 Geetrip Inc. All rights reserved.
//

#import "GeHomeViewController.h"
#import "GEDetailViewController.h"
#import "GEHomeNetWorkHelp.h"
#import "ActListModel.h"
#import "TransverseTableView.h"
#import "ADTranTableView.h"
#import "GEPlanCell.h"
#import "SearchModel.h"
#import "GEWorldListViewController.h"

#define SearchTableViewTag 100
#define PlanTableViewTag 200
#define ThemeTableViewTag 300

@interface GEHomeViewController () <ADRecordDelegate,UIGestureRecognizerDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UISearchBar *mySearchBar;

//数据源
@property (nonatomic,strong) NSMutableArray *actListDataArray;
@property (nonatomic,strong) NSMutableArray *planListArray;
@property (nonatomic,strong) NSMutableArray *searchDataArray;

//当前正在请求的url
@property (nonatomic,strong) NSURLSessionDataTask *currentTask;

//视图元素
@property (nonatomic,strong) UIScrollView *mapScrollView;
@property (nonatomic,strong) TransverseTableView *themeTableView;
@property (nonatomic,strong) UITableView *searchTableView;
@property (nonatomic,strong) ADTranTableView *myTableView;
@property (nonatomic,strong) UILabel *noPlanLabel;

//导航按钮
@property (nonatomic,strong) UIBarButtonItem *left,*right1,*right2,*right3;

@end

@implementation GEHomeViewController

+ (GEHomeViewController *)defaultHomeManager
{
    static GEHomeViewController *manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[self alloc] init];
    });
    
    return manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.actListDataArray = [NSMutableArray array];
    self.planListArray = [NSMutableArray array];
    self.searchDataArray = [NSMutableArray array];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self loadSubViews];
    [self configNavBar];
    [self getActList];
}

#pragma mark - 获取网络资源
- (void)getActList
{
    [GEHomeNetWorkHelp getActListSuccess:^(id responseObject) {
        [_actListDataArray removeAllObjects];
        NSArray *dataArray = [responseObject objectForKey:@"data"];
        for (NSDictionary *dic in dataArray) {
            ActListModel *model = [[ActListModel alloc] initWithListDic:dic];
            [_actListDataArray addObject:model];
        }
        self.themeTableView.imageArray = _actListDataArray;
        if (self.actListDataArray.count != 0) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
            [self.themeTableView.myTableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionTop];
            ActListModel *firstModel = self.actListDataArray.firstObject;
            [self getPlanWithTourId:firstModel.tourId];
        }
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)getPlanWithTourId:(NSString *)tourId
{
    [self.currentTask cancel];

    self.currentTask = [GEHomeNetWorkHelp getPlanWithTourId:tourId success:^(id responseObject) {
        NSArray *dataArray = [responseObject objectForKey:@"data"];
        [_planListArray removeAllObjects];

        if ([dataArray isKindOfClass:[NSArray class]] && dataArray.count != 0) {
            for (NSDictionary *dic in dataArray) {
                PlanModel *model = [[PlanModel alloc] initWithPlanDic:dic];
                [_planListArray addObject:model];
            }
        }else{
            
        }
        
        [self.myTableView reloadData];
        
    } failure:^(NSError *error) {
        [_planListArray removeAllObjects];
        [self.myTableView reloadData];

    }];
}

#pragma mark - 加载页面
- (void)configNavBar
{
    _mySearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    _mySearchBar.searchBarStyle = UISearchBarStyleMinimal;
    _mySearchBar.delegate = self;
    _mySearchBar.backgroundColor = [UIColor clearColor];
    _mySearchBar.placeholder = @"搜索目的地，主题，酒店品牌";
    self.navigationItem.titleView = _mySearchBar;
    
    UIButton *leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 44)];
    leftButton.backgroundColor = [UIColor clearColor];
    [leftButton setImage:[UIImage imageNamed:@"world"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(openWorldList) forControlEvents:UIControlEventTouchUpInside];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:14];

    [leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.left = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    UIButton *rightbutton1 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 44)];
    rightbutton1.backgroundColor = [UIColor clearColor];
    [rightbutton1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [rightbutton1 setImage:[UIImage imageNamed:@"nofitication"] forState:UIControlStateNormal];
    rightbutton1.titleLabel.font = [UIFont systemFontOfSize:14];

    self.right1 = [[UIBarButtonItem alloc] initWithCustomView:rightbutton1];
    
    UIButton *right = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 44)];
    right.backgroundColor = [UIColor clearColor];
    [right setImage:[UIImage imageNamed:@"list"] forState:UIControlStateNormal];
    [right setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    right.titleLabel.font = [UIFont systemFontOfSize:14];
    self.right2 = [[UIBarButtonItem alloc] initWithCustomView:right];
    
    UIButton *right3 = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    right3.backgroundColor = [UIColor clearColor];
    [right3 setTitle:@"取消" forState:UIControlStateNormal];
    [right3 addTarget:self action:@selector(cancelSarch) forControlEvents:UIControlEventTouchUpInside];
    [right3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    right3.titleLabel.font = [UIFont systemFontOfSize:14];
    self.right3 = [[UIBarButtonItem alloc] initWithCustomView:right3];
    
    [self setDefaultNavBar];
}

- (void)setDefaultNavBar
{
    [UIView animateWithDuration:0.3 animations:^{
        self.navigationItem.rightBarButtonItem = nil;
        self.navigationItem.leftBarButtonItem = self.left;
        self.navigationItem.rightBarButtonItems  = [NSArray arrayWithObjects:self.right1,self.right2, nil];
    }];
}

- (void)setSearchNavBar
{
    self.navigationItem.rightBarButtonItems = nil;
    self.navigationItem.rightBarButtonItem  = self.right3;

    [UIView animateWithDuration:0.3 animations:^{
        self.navigationItem.leftBarButtonItem = nil;
    } completion:^(BOOL finished) {
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)loadSubViews
{
    [self loadTableView];
    [self loadMapView];
    [self loadThemeTableView];
}

- (void)loadTableView
{
    self.myTableView = [[ADTranTableView alloc] initWithFrame:CGRectMake(0, 0, 300, SCREEN_WIDTH) style:UITableViewStylePlain];
    self.myTableView.showsHorizontalScrollIndicator = NO;
    self.myTableView.showsVerticalScrollIndicator = NO;
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.tag = PlanTableViewTag;
    
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.pagingEnabled = YES;
    [self.view addSubview:self.myTableView];
    
    self.myTableView.center = CGPointMake(SCREEN_WIDTH/2.0, 150 + 64);
    
    self.noPlanLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    self.noPlanLabel.center = self.myTableView.center;
    self.noPlanLabel.backgroundColor = [UIColor whiteColor];
    self.noPlanLabel.textAlignment = NSTextAlignmentCenter;
    self.noPlanLabel.userInteractionEnabled = YES;
    self.noPlanLabel.text = @"暂时没有可选的行程";
    [self.view addSubview:self.noPlanLabel];
}

- (void)loadMapView
{
    UIImage *img = [UIImage imageNamed:@"worldmap"];
    CGFloat mapHeight = SCREEN_WIDTH * 3.0 * img.size.height / img.size.width;
    self.mapScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - mapHeight - Cell_height - 20, SCREEN_WIDTH, mapHeight)];
    self.mapScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * 3.0, mapHeight);
    self.mapScrollView.backgroundColor = [UIColor whiteColor];
    self.mapScrollView.showsHorizontalScrollIndicator = NO;
    self.mapScrollView.showsVerticalScrollIndicator = NO;
    self.mapScrollView.delegate = self;
    [self.view addSubview:self.mapScrollView];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * 3.0, mapHeight)];
    imageView.image = img;
    [self.mapScrollView addSubview:imageView];
}

- (void)loadThemeTableView
{
    UIView *openMenuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 30, SCREEN_HEIGHT)];
    [self.view addSubview:openMenuView];
    
    self.themeTableView = [[TransverseTableView alloc] initWithFrame:CGRectMake(Cell_width, SCREEN_HEIGHT - Cell_height, SCREEN_WIDTH - Cell_width, Cell_height)];
    self.themeTableView.tag = ThemeTableViewTag;
    self.themeTableView.recordDelegate = self;
    [self.view addSubview:self.themeTableView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT - Cell_height, Cell_width, Cell_height)];
    [self.view addSubview:button];
    button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 30, 0);
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0.5, Cell_height)];
    lineView.backgroundColor = [UIColor lightGrayColor];
    [button addSubview:lineView];
    
    [button setImage:[UIImage imageNamed:@"me"] forState:UIControlStateNormal];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, button.frame.size.height - 30, button.frame.size.width, 20)];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.font = [UIFont systemFontOfSize:13];
    nameLabel.text = @"我的";
    [button addSubview:nameLabel];
    
    [button addTarget:self.drawer action:@selector(open) forControlEvents:UIControlEventTouchUpInside];
}

- (void)loadSearchTableView
{
    if (self.searchTableView == nil) {
        self.searchTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
        self.searchTableView.delegate = self;
        self.searchTableView.tag = SearchTableViewTag;
        self.searchTableView.dataSource = self;
        [self.view addSubview:self.searchTableView];
    }
    self.searchTableView.alpha = 1;
    [self.view bringSubviewToFront:self.searchTableView];
}

#pragma mark - 搜索框的代理
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    if (self.drawer.drawerState == ICSDrawerControllerStateOpen || self.drawer.drawerState == ICSDrawerControllerStateOpening) {
        
        return NO;
    }
    
    return YES;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_mySearchBar resignFirstResponder];
    [GEHomeNetWorkHelp getSearchContentWithKeyword:searchBar.text success:^(id responseObject) {
        [self.searchDataArray removeAllObjects];
        
        for (NSDictionary *dic in responseObject) {
            SearchModel *model = [[SearchModel alloc] initWithDic:dic];
            [self.searchDataArray addObject:model];
        }
        
        [self.searchTableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [self loadSearchTableView];
    [self setSearchNavBar];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchBar.text.length == 0) {
        [self.searchDataArray removeAllObjects];
        [self.searchTableView reloadData];
    }
}

- (void)clickedRecordWithModel:(ActListModel *)model
{
    [self getPlanWithTourId:model.tourId];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    if ([touch.view isKindOfClass:[UIButton class]]){
        return NO;
    }else if ([touch.view isKindOfClass:NSClassFromString(@"UITableViewCellContentView")]){
        return NO;
    }
    
    return YES;
}

- (void)cancelSarch
{
    [_searchDataArray removeAllObjects];
    [_searchTableView reloadData];
    [_mySearchBar resignFirstResponder];
    self.searchTableView.alpha = 0;
    _mySearchBar.text = @"";
    [self setDefaultNavBar];
}

#pragma mark - tableView 代理
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag == SearchTableViewTag) {
        
        return self.searchDataArray.count;
    }
    
    if (self.planListArray.count == 0) {
        self.noPlanLabel.hidden = NO;
    }else{
        self.noPlanLabel.hidden = YES;
    }
    
    return self.planListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == SearchTableViewTag) {
        static NSString *reuseId = @"SearchCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        }
        
        SearchModel *model = [self.searchDataArray objectAtIndex:indexPath.row];
        cell.textLabel.text = model.hotelName;
        
        return cell;
    }
    
    static NSString *reuseId = @"GEPlanCell";
    GEPlanCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    if (cell == nil) {
        cell = [[GEPlanCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    PlanModel *model = [self.planListArray objectAtIndex:indexPath.row];
    cell.model = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag == SearchTableViewTag) {
        return 50;
    }
    return SCREEN_WIDTH;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.mySearchBar resignFirstResponder];
    if (tableView.tag == SearchTableViewTag) {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        GEDetailViewController *detail = [[GEDetailViewController alloc] init];
        [self.navigationController pushViewController:detail animated:YES];
    }else{
        PlanModel *model = [self.planListArray objectAtIndex:indexPath.row];
        GEDetailViewController *detail = [[GEDetailViewController alloc] init];
        detail.myPlanModel = model;
        [self.navigationController pushViewController:detail animated:YES];
    }
}

//左导航点击
- (void)openWorldList
{
    GEWorldListViewController *listVc = [[GEWorldListViewController alloc] init];
    [self.navigationController pushViewController:listVc animated:YES];
}

#pragma mark ----------------ICSDrawerControllerPresenting--------------------
- (void)drawerControllerWillOpen:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = NO;
    self.navigationController.navigationBar.userInteractionEnabled = NO;
}

- (void)drawerControllerDidClose:(ICSDrawerController *)drawerController{
    self.view.userInteractionEnabled = YES;
    self.navigationController.navigationBar.userInteractionEnabled = YES;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.mySearchBar resignFirstResponder];
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
