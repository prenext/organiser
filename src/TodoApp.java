
class TodoApp {

    public static void main(String[] args) {
        int [] array = {1, 3, 2, 7, 8, 5, 0, 9, 4};
        quickSort(array);
    }

    private static void quickSort(int[] array) {
        int low = 0, high = array.length - 1;

        partition(array, low, high);

    }

    private static void partition(int[] array, int low, int high) {
        int mid = high / 2;
    }

}