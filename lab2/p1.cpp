/*
These could have been easily done using bitsets in cpp

    bitset <32> b1(x);
    cout<<"bitset value --> ";
    cout<<b1<<endl;

but this has been custom created by me

*/


#include <bits/stdc++.h>
using namespace std;

#define all(x) x.begin(),x.end()
typedef long long int ll;

const int mod = 1e9 +7;
const int N = 1e5 + 6; 


/*
binary representation of a signed integer with all bits from 30 to 0

the signed bit case is handled in a seperate condition
*/
void printbin(int32_t x){
    cout<<"for "<<x<<" --> ";
    int arr[32];
    if(x < 0)  arr[0] = 1;
    else arr[0] = 0;

    for(int i=30;i >=0;i--){
        if(x & (1<<i))
            arr[31-i] = 1;
        else
            arr[31-i] = 0;    
    }

    for(auto i : arr) cout<<i<<" ";
    cout<<endl;
}



/*
binary representation of an unsigned interger comprising all bits from 0 to 31

*/
void printbinus(uint32_t x){
    cout<<"for "<<x<<" --> ";
    int arr[32];
    for(int i=31;i >=0;i--){
        if(x & (1LL<<i))
            arr[31-i] = 1;
        else
            arr[31-i] = 0;
    }

    for(auto i : arr) cout<<i<<" ";
    cout<<endl;
}

/*
char is just 1 byte --> so 8 bits are sufficient
*/
void printbin(char c){
    cout<<"for "<<c<<" --> ";
    for(int i=7;i>=0;i--){
        cout<<!!(c&(1<<i));
    }
    cout<<endl;
}

/*
binary of float datatypes -->
mantissa would be allocatd 4 bytes
*/
void printbin(float f){
    int e; float c;
    e  = f;
    c = f - e;

    for(int i=30;i>=0;i--){
        if(e & (1<<i)) cout<<1;
        else cout<<0;
    }

    float dd = 0.5f;
    int cnt =6;
    cout<<".";
    while(cnt--){
        c=c*2;
        int i = c;
        cout<<i;
        if(i == 1) c-=i;
    }

    cout<<endl;


}

/*
binary of double datatypes
--> mantissa wuuld be allocated 8 bytes
*/
void printbin(double d){
    int e; double c;
    e  = d;
    c = d - e;

    for(int i=30;i>=0;i--){
        if(e & (1<<i)) cout<<1;
        else cout<<0;
    }

    double dd = 0.5;
    int cnt =32;
    cout<<".";
    while(cnt--){
        c=c*2;
        int i = c;
        cout<<i;
        if(i == 1) c-=i;
    }
    cout<<endl;


}


int32_t main(int argc, char* argv[]){
    #ifndef ONLINE_JUDGE
    freopen("input.txt","r",stdin);
    freopen("output.txt","w",stdout);
    #endif
    printbin(10);
    printbin(-10);
    unsigned int num1 = (unsigned int) 10;
    printbinus(num1);


    // for characters
    printbin('a');

    // floating points
    printbin(12.125f);


    // double poinst
    printbin((double)1234567.1234567);
}