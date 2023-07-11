package data;

import java.io.Serializable;

public abstract class Message implements Serializable {
    // A message that tells the current price of the selling item
    public static class ItemPrice extends Message {
        public float price;

        public ItemPrice(float price) { this.price = price; }
        @Override
        public String toString() {
            return "BidPrice(" + price + ")";
        }
    }

    public static class Won extends Message {
        public float price;

        public Won(float price) { this.price = price; }
        @Override
        public String toString() {
            return "Won(" + price + ")";
        }
    }
}

