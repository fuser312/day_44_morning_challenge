import 'dart:math';

// Trapping Rain Water
// Given n non-negative integers representing an elevation map where the width
// of each bar is 1, compute how much water it is able to trap after raining.
/// https://assets.leetcode.com/uploads/2018/10/22/rainwatertrap.png
// The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1].
// In this case, 6 units of rain water (blue section) are being trapped.

// Example:
// Input: [0,1,0,2,1,0,1,3,2,1,2,1]
// Output: 6

int getTotalWaterVolume(List<int> elevationMap){
  int totalWater = 0;
  for(int i = 1; i< elevationMap.length; i++){
    print(i);
    int leftMax;
    int rightMax;
    if(i == 1 ){
       leftMax = elevationMap[1];
       rightMax = (elevationMap.sublist(i+1 , elevationMap.length).reduce(max));
    }
    else if(i == elevationMap.length-1){
      print(elevationMap[elevationMap.length-1]);
       rightMax = elevationMap[elevationMap.length-1];
       leftMax = (elevationMap.sublist(1, i-1)).reduce(max);
       
    }
    
    else{
     leftMax = (elevationMap.sublist(1, i-1)).reduce(max);
     rightMax = (elevationMap.sublist(i+1 , elevationMap.length).reduce(max));
    
    }
    
    int lowerElevation = min(leftMax, rightMax);
    int waterStored = lowerElevation - elevationMap[i]  ;
    totalWater = totalWater + waterStored;
  }
  return totalWater;
}

main() {
  print(getTotalWaterVolume([0,1,0,2,1,0,1,3,2,1,2,1]));
}
