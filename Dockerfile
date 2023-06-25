FROM ubuntu

ARG USERNAME
ENV MYNAME='unknown'

# Create non-root user with specified user name
RUN adduser --disabled-password --gecos '' $USERNAME

# Switch to non-root user
USER $USERNAME

# Create script which writes host's CPU into a file
RUN echo '#!/bin/bash\n\
echo "File created by "$MYNAME > /output/cpu.txt\n\
echo "Host machine CPU info:" >> /output/cpu.txt\n\
lscpu >> /output/cpu.txt' > ~/script.sh && chmod +x ~/script.sh

# Run script on startup
CMD exec $HOME/script.sh

# How to use:
# docker build --build-arg USERNAME=username -t myimage .
# docker run --rm --env MYNAME=name --volume $(pwd)/:/output myimage
# docker rmi myimage