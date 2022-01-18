/**
 * CS2292 Lab 0
 *
 */
#include <iostream>
#include <chrono> 
using namespace std::chrono;
using namespace std;


int arr[10000];
void takearray(){
	for(int i=0;i<10000;i++){
		cin>>arr[i];
	}
}

class Node{
	public:
	int val;
	Node* next;
};



void takeNode(int n){

	Node* head = new Node();
	Node* headfinal = head;
	int firstval; cin>>firstval;
	head->val = firstval;
	for(int i=1;i<n;i++){
		int val; cin>>val;
		Node* temp = new Node();
		temp->val = val;
		head->next = temp;
		head = temp;
	}
}

int main()
{
  auto start1 = high_resolution_clock::now();
  	takearray();
  auto stop1 = high_resolution_clock::now();
  

  auto start2 = high_resolution_clock::now();
	
  	int n; cin>>n;
  	takeNode(n);

  auto stop2 = high_resolution_clock::now();
  auto duration1 = duration_cast<microseconds>(stop1 - start1); 
  auto duration2 = duration_cast<microseconds>(stop2 - start2);
  cout<<" array time --> ";
  cout << duration1.count() <<endl;
  cout<<"linked list time with n = "<<n<<"-->  "<< duration2.count()<<endl;
  cout<<" ---------------------------------------------------------------------"<<endl;

  return 0;

}


