# echo export SINGULARITY_BIND=$SINGULARITY_BIND >> $SINGULARITY_ENVIRONMENT

# for dir in $(echo $SINGULARITY_BIND | tr ',' '\n'); do
#     command="mkdir -p $dir"
#     echo $command
#     eval $command
# done
