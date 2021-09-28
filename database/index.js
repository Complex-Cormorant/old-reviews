const mongoose = require('mongoose');
mongoose.connect('mongodb://localhost:27017/test', {useNewUrlParser: true, useUnifiedTopology: true});

// need to include product, page, count?
const Review = mongoose.model('Review', {
  product: Number,
  page: Number,
  count: Number,
  results: [
    review_id: Number,
    rating: String,
    summary: String,
    recommend: Boolean,
    response: null,
    body: String,
    date: Date,
    reviewer_name: String,
    photos: [{
      id: Number,
      url: String
    }]
  ]
});

const Meta = mongoose.model('Meta', {
  product_id: Number,
  ratings: {
    1: Number,
    2: Number,
    3: Number,
    4: Number,
    5: Number
  },
  recommended: {
    false: Number,
    true: Number
  },
  characteristics: {
    Fit: {
      id: Number,
      value: Number
    },
    Length: {
      id: Number,
      value: Number
    },
    Size: {
      id: Number,
      value: Number
    },
    Width: {
      id: Number,
      value: Number
    },
    Comfort: {
      id: Number,
      value: Number
    },
    Quality: {
      id: Number,
      value: Number
    },
  }
})

