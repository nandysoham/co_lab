#include <bits/stdc++.h>
using namespace std;
using namespace chrono;

#define all(x) x.begin(),x.end()
#define ff first
#define ss  second
#define pb push_back
#define fastio() ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL)
typedef long long int ll;
const int mod = 1e9 +7;
const int N = 2e5 + 6;

// __print() functions
void __print(int x) {cerr<<x; }
void __print(long long x) { cerr<<x; }
void __print(string x){ cerr<<x; }
void __print(char x){ cerr<<x; }
void __print(bool x){ cerr<<x; }
void __print(double x){ cerr<<x; }


// printing complex datatypes
template <class T> void __print(vector <T> v){ cerr<<"[ "; for(T i:v){ __print(i);cerr<<" "; } cerr<<"]"; }
template <class T, class V> void __print(pair <T,V> p){ cerr <<"{ "; __print(p.first);cerr<<" , ";__print(p.second);cerr<<" }";} 
template <class T> void __print(set <T> v) {cerr << "[ "; for (T i : v) {__print(i); cerr << " ";} cerr << "]";}
template <class T> void __print(multiset <T> v) {cerr << "[ "; for (T i : v) {__print(i); cerr << " ";} cerr << "]";}
template <class T, class V> void __print(map <T, V> v) {cerr << "[ "; for (auto i : v) {__print(i); cerr << " ";} cerr << "]";}
template <class T> void __print(vector <vector <T> > v){ cerr<<endl<<endl; for( auto i:v){ for(T j:i){ cerr<<j<<" ";} cerr<<endl; } cerr<<endl<<endl;}


#ifndef ONLINE_JUDGE
    #define debug(x) cerr<<#x<<" --> ";__print(x);cerr<<endl; 
#else
    #define debug(x) 
#endif

//functions-------------------------------------------------------------------------------------------------------------------------
void google(int t) {cout << "Case #" << t << ": ";}
ll binpower(ll a, ll b, ll m){ ll res =1; while(b>0){ if(b&1) res = res*a%m;a = a*a%m;b = b>>1; }   return res;}
int ext_gcd(int a,int b){if(!a || !b) return a|b; int shift = __builtin_ctz(a|b); a = a>>__builtin_ctz(a);do{ b= b>>__builtin_ctz(b);if(a>b){ swap(a,b);} b-=a; }while(b);return a<<=shift;}
void precision(int a) {cout << setprecision(a) << fixed;}
ll ncr(ll n,ll r){ if(r>n || r<0) return 0; ll num = 1,den =1; r = min(r, n-r);for(int i=0;i<r;i++){ num*=(n-i);den*=(i+1);}return num/den;}
// ---------------------------------------------------------------------------------------------------------------------------------


void solve(){
    int n; cin>>n;
    cout<<"for n = "<<n<<" --> ";
    vector <vector <int> > mat1(n, vector <int> (n)), mat2(n, vector <int> (n)),  ans(n, vector <int> (n));
    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            cin>>mat1[i][j];
        }
    }

    for(int i=0;i<n;i++){
        for(int j=0;j<n;j++){
            cin>>mat2[i][j];
        }
    }

    
    for(int i=0;i<n;i++){
        
        for(int j=0;j<n;j++){
            int sum = 0;
            for(int k=0;k<n;k++){
                sum += mat1[i][k] * mat2[k][j];
            }

            ans[i][j] = sum;
        }
    }

    // debug(ans);


}


int32_t main(int argc, char* argv[]){
    
    fastio();
    auto start1 = high_resolution_clock::now();
    solve();
    auto end1=  high_resolution_clock::now();
    double duration = duration_cast<nanoseconds>(end1 - start1).count();
    duration *= 1e-9;

    #ifndef ONLINE_JUDGE
        cout<<"Time - "<<fixed<<duration<<setprecision(9) <<" s"<<endl;
    #endif

}
