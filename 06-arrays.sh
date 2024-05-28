#!/bin/bash
MOVIES=(Bahubali RRR Insterstellar)

#index number always start with zero
# index numbers are 0,1,2
#size of the array is 3

echo "First Movie is: ${MOVIES[0]}"
echo "Second Movie is: ${MOVIES[1]}"
echo "Third Movie is: ${MOVIES[2]}"
# Total elements of the array is indicated by the index of '@'
echo "No of movies are: ${MOVIES[@]}"