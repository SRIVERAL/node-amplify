# Use an official Node.js runtime as a parent image
FROM node:16

# Install Git, AWS CLI v2, and Terraform
RUN apt-get update && \
    apt-get install -y git && \
    apt-get install -y unzip && \
    curl "https://d1vvhvl2y92vvt.cloudfront.net/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -f awscliv2.zip && \
    curl -LO "https://releases.hashicorp.com/terraform/1.0.7/terraform_1.0.7_linux_amd64.zip" && \
    unzip terraform_1.0.7_linux_amd64.zip && \
    mv terraform /usr/local/bin/ && \
    rm terraform_1.0.7_linux_amd64.zip && \
    apt-get clean

# Install AWS Amplify CLI
RUN npm install -g @aws-amplify/cli

# Set the working directory to /app
WORKDIR /app

# Expose the default port for Node.js (you can change this if needed)
EXPOSE 3000

# Start a shell session when the container starts
CMD ["/bin/bash"]
