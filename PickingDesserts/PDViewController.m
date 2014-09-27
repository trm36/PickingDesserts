//
//  PDViewController.m
//  PickingDesserts
//
//  Created by Taylor Mott on 9.27.14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PDViewController.h"

@interface PDViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (strong, nonatomic) UILabel *dessertLabel;
@property (strong, nonatomic) NSString *fruitSelected;
@property (strong, nonatomic) NSString *liquidSelected;
@property (strong, nonatomic) NSString *dessertSelected;
@end

@implementation PDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.width - 50)];
    pickerView.dataSource = self;
    pickerView.delegate = self;
    [self.view addSubview:pickerView];
    
    self.fruitSelected = [NSString new];
    self.fruitSelected = [NSString stringWithFormat:@"%@", [self data][0][0]];
    
    self.liquidSelected = [NSString new];
    self.liquidSelected = [NSString stringWithFormat:@"%@", [self data][1][0]];
    
    self.dessertSelected = [NSString new];
    self.dessertSelected = [NSString stringWithFormat:@"%@", [self data][2][0]];
    
    self.dessertLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, self.view.frame.size.width, 50)];
    [self setDessertLabelText];
    [self.view addSubview:self.dessertLabel];
    
    [self setBackgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI Picker View Data Source

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [[self data][component] count];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [[self data] count];
}

#pragma mark - UI Picker View Delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self data][component][row];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (component)
    {
        case 0:
            self.fruitSelected = [NSString stringWithFormat:@"%@", [self data][component][row]];
            [self setBackgroundColor];
            break;
        case 1:
            self.liquidSelected = [NSString stringWithFormat:@"%@", [self data][component][row]];
            break;
        case 2:
            self.dessertSelected = [NSString stringWithFormat:@"%@", [self data][component][row]];
            break;
        default:
            break;
    }
    [self setDessertLabelText];
}

#pragma mark - Picker View Data Arrays

- (NSArray *)data {
    
    return @[
             [self fruits],
             [self liquids],
             [self desserts]
             ];
    
}

- (NSArray *)fruits {
    
    return @[@"banana",
             @"orange",
             @"apple"];
}

- (NSArray *)liquids {
    return @[@"milk",
             @"soda",
             @"coffee"];
}

- (NSArray *)desserts {
    return @[@"shake",
             @"sundae",
             @"cookie"];
}

/*
 * sets self.dessert Label text to current fruitSelected, liquidSelected, dessertSelected
 */

- (void)setDessertLabelText
{
    self.dessertLabel.text = [NSString stringWithFormat:@"%@ %@ %@", self.fruitSelected, self.liquidSelected, self.dessertSelected];
}

/*
 * set the view background color based on fruit selected
 * banana = yellowColor
 * orange = orangeColor
 * apple = redColor
 */

- (void)setBackgroundColor
{
    if ([self.fruitSelected  isEqual: @"banana"])
    {
        self.view.backgroundColor = [UIColor yellowColor];
    }
    else if ([self.fruitSelected isEqualToString:@"orange"])
    {
        self.view.backgroundColor = [UIColor orangeColor];
    }
    else if ([self.fruitSelected isEqualToString:@"apple"])
    {
        self.view.backgroundColor = [UIColor redColor];
    }
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
