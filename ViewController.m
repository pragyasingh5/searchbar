//
//  ViewController.m
//  searchbar
//
//  Created by Pragya Singh on 4/18/14.
//  Copyright (c) 2014 . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *array;
@property (strong,nonatomic) NSArray *searchresults;

@end

@implementation ViewController

- (void)viewDidLoad
{
 
    self.array = [[NSArray alloc ] initWithObjects:@"Ada", @"Algol", @"Beta", @"BLISS",@"C", @"C#", @"COBOL", @"C++", @"CORAL",@"Euphoria",@"FORTRAN", @"Hope", @"HyperTalk", @"Java",@"JavaScript", @"JSON", @"JQuery", @"Lisp", @"Modula",@"MUMPS", @"Objective-C", @"Oz", @"Pascal", @"Perl",@"Php", @"Python", @"Prolog", @"Ruby", @"Self",@"sh", @"SLAM", @"SML", @"Sina", @"SPITBOL",@"TECO", @"Turing", @"Theta", @"Tex", @"UFO",@"Until", @"VBScript", @"WordBasic", @"Yorick", @"ZPL",@"Reduce", @"Pilot", @"Pike", @"OPS5", @"M",@"Lua" , nil];
    self.searchresults = [[NSArray alloc] init];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Table View Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView){
        
        return [self.searchresults count];

    }
    else{
        
        return [self.array count];
        
    }
    
    //return [self.array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    
    if (tableView == self.searchDisplayController.searchResultsTableView){
        
        cell.textLabel.text = [self.searchresults objectAtIndex:indexPath.row];
    }
    else{
        
        cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    }

    //cell.textLabel.text = [self.array objectAtIndex:indexPath.row];
    return cell;
}

#pragma Search Methods

-(void)filterContentForSearchText:(NSString *)searchtext scope:(NSString *) scope{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith [c] %@", searchtext];
    self.searchresults = [self.array filteredArrayUsingPredicate:predicate];
}

-(BOOL) searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    
    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
     return YES;
     }


@end
