func merge<T: Comparable>(leftSubArray: [T], rightSubArray: [T]) -> [T] {
  var leftIndex = 0
  var rightIndex = 0
  var finalArray = [T]()
  if finalArray.capacity < (leftSubArray.count + rightSubArray.count) {
    finalArray.reserveCapacity(leftSubArray.count + rightSubArray.count)
  }

  while leftIndex < leftSubArray.count && rightIndex < rightSubArray.count {
    if leftSubArray[leftIndex] < rightSubArray[rightIndex] {
      finalArray.append(leftSubArray[leftIndex])
      leftIndex += 1
    } else if leftSubArray[leftIndex] > rightSubArray[rightIndex] {
      finalArray.append(rightSubArray[rightIndex])
      rightIndex += 1
    } else {
      finalArray.append(leftSubArray[leftIndex])
      leftIndex += 1
      finalArray.append(rightSubArray[rightIndex])
      rightIndex += 1
    }
  }


  while leftIndex < leftSubArray.count {
    finalArray.append(leftSubArray[leftIndex])
    leftIndex += 1
  }

  while rightIndex < rightSubArray.count {
    finalArray.append(rightSubArray[rightIndex])
    rightIndex += 1
  }

  return finalArray
}

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
  guard array.count > 1 else { return array }
  let middleIndex = array.count / 2
  let leftSide = mergeSort(Array(array[0..<middleIndex]))
  let rightSide = mergeSort(Array(array[middleIndex..<array.count]))
  return merge(leftSubArray: leftSide, rightSubArray: rightSide)
}