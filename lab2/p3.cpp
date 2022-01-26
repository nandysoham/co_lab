


#include <bits/stdc++.h>
using namespace std;

#define all(x) x.begin(),x.end()
typedef long long int ll;

const int mod = 1e9 +7;
const int N = 1e5 + 6; 


int32_t main(int argc, char* argv[]){
    uint32_t x = 0xff105613;  
    /*
    giving a hexadecimal value --> ff105613
    (0x  --> usual way of representation of hex values)
    
    */
    cout<<(void*)&x<<endl;  // this is the address of x

    // or
    printf("%p\n", (void*)&x);

    /*
    output --> 
    0x7ffee9f9387c

    note this is a hexadecimal representaion of the address

    now the value actually corresponds to
    |  1 1 1 1  |  1 1 1 1  |  0 0 0 1  |  0 0 0 0  |  0 1 0 1  |  0 1 1 0  |  0 0 0 1  |  0 0 1 1  |
    in decimal -->

    so how the bytes are stored
    |  1 1 1 1 1 1 1 1      |    0 0 0 1 0 0 0 0      |     0 1 0 1 0 1 1 0      |   0 0 0 1 0 0 1 1  |

    what we want --> the reverse of the following 
    |   0 0 0 1 0 0 1 1  |      0 1 0 1 0 1 1 0      |     0 0 0 1 0 0 0 0       |  1 1 1 1 1 1 1 1      |
    

    HOW TO EXTRACT EACH BYTE 

    have an 
    and with 00000000 00000000 00000000 11111111 for the 4th byte
    and with 00000000 00000000 11111111  00000000 for the 3rd byte

    .... and so on


    */
   uint32_t p0,p1,p2,p3;
   uint32_t res;

   p0 = (x & 0x000000ff) << 24u;  // we take the 4th byte --> extract the number by having an and with 11111111 --> then making it the first byte
   p1 = (x & 0x0000ff00) << 8u;     // same extract the info from the 3rd bute and make it the second byte
   p2 = (x & 0x00ff0000) >> 8u;     // extract info from 2nd byte and make it the 3rd byte
   p3 = (x & 0xff000000) >> 24u;    // extract info from 1st byte and make it the 4th byte

   res = p0 | p1 | p2 | p3;       // or all of them *** you could have also add all of them
    printf("%" PRIX32 "\n", res);
   

}