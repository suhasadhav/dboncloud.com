# Use Ruby as base image
FROM ruby:3.2

# Set working directory inside the container
WORKDIR /srv/jekyll

# Copy Gemfile and Gemfile.lock first (to leverage Docker cache)
COPY Gemfile ./

# Install gems from Gemfile
RUN bundle install

# Copy the rest of the site files
COPY . .

# Expose the default Jekyll port
EXPOSE 4000

# Command to serve the Jekyll site
CMD ["jekyll", "serve", "--host", "0.0.0.0", "--watch", "--drafts", "--force_polling"]
