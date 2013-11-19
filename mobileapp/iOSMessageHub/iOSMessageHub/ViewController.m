//
//  ViewController.m
//  iOSMessageHub
//
//  Created by Nicholas Teleky on 11/18/13.
//  Copyright (c) 2013 Nicholas Teleky. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

    @property (weak, nonatomic) IBOutlet UITextField *username;
    @property (weak, nonatomic) IBOutlet UITextField *message;
    @property (weak, nonatomic) IBOutlet UITableView *tableView;
    @property (strong, nonatomic) NSMutableArray *jsonArray;
    @property (strong, nonatomic) NSMutableArray *usernameArray;
    @property (strong, nonatomic) NSMutableArray *contentArray;

    - (IBAction)postMessage:(id)sender;
    - (IBAction)showFailAlert:(id)sender;
    - (IBAction)showSuccessAlert:(id)sender;


@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    _usernameArray = [[NSMutableArray alloc] init];
    _contentArray = [[NSMutableArray alloc] init];
    _jsonArray = [[NSMutableArray alloc] init];
    [self loadMessages];
    self.tableView.dataSource = self;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)postMessage:(id)sender {
    
    //My MessageHub
    //NSString *urlAsString = @"http://fast-reef-2117.herokuapp.com/messages";
    //Ming's MessageHub:
    NSString *urlAsString = @"http://messagehub.herokuapp.com/messages.json";
    //Build JSON to be sent
    NSDictionary *inputData = [[NSDictionary alloc] initWithObjectsAndKeys:
                               _username.text, @"username",
                               _message.text, @"content",
                               @"1", @"app_id",
                               nil];
    NSError *error = nil;
    NSData *jsonInputData = [NSJSONSerialization dataWithJSONObject:inputData options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:jsonInputData encoding:NSUTF8StringEncoding];
    
    //Prepare the URL and the POST request
    NSData* responseData = nil;
    NSURL *url=[NSURL URLWithString:[urlAsString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    responseData = [NSMutableData data] ;
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSData *req=[NSData dataWithBytes:[jsonString UTF8String] length:[jsonString length]];
    [request setHTTPBody:req];
    
    //Send the request and receive the response.
    NSURLResponse* response;
    responseData = [NSURLConnection sendSynchronousRequest:request     returningResponse:&response error:&error];
    NSString *responseString = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    if ([responseString rangeOfString:@"Success"].location == NSNotFound) {
        // Give feedback that POST was successfully sent
        NSLog(@"Fail");
        [self showFailAlert:self];
        
    }
    else {
        // Something went wrong
        NSLog(@"Winner!");
        [self showSuccessAlert:self];
    }
    
    
    NSLog(@"the final output is:%@",responseString);
    
    
}

- (IBAction)showFailAlert:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Post Failed"
                                                      message:@"Your post failed. Check your input and try again."
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
}

- (IBAction)showSuccessAlert:(id)sender {
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Post Successful"
                                                      message:@"Your message was sucessfully posted!"
                                                     delegate:nil
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
}

//TABLE VIEW/GET MESSAGES

- (void)loadMessages {
    // create the URL we'd like to query
    NSURL *myURL = [[NSURL alloc]initWithString:@"http://messagehub.herokuapp.com/messages.json"];
    
    // we'll receive raw data so we'll create an NSData Object with it
    NSData *myData = [[NSData alloc]initWithContentsOfURL:myURL];
    
    // now we'll parse our data using NSJSONSerialization
    id myJSON = [NSJSONSerialization JSONObjectWithData:myData options:NSJSONReadingMutableContainers error:nil];
    
    // typecast an array and list its contents
    _jsonArray = (NSMutableArray *)myJSON;
    // take a look at all elements in the array
    for (id message in _jsonArray) {
        // NSLog(@"Element: %@", [element description]);
        NSString *content = [message objectForKey:@"content"];
        //[_contentArray addObject:content];
        NSString *username = [message objectForKey:@"username"];
        [_usernameArray addObject:username];
        
        //TEST TO SHOW PROPER JSON PARSING:
        NSLog(@"%@: %@", username, content);
    }
}


//Mandatory for UI View stuff

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.jsonArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"message_cell";

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSString *username = [self.jsonArray objectAtIndex:indexPath.row];

    [cell.textLabel setText:username];
    [cell.detailTextLabel setText:@"via Codigator"];
    return cell;
}




@end
