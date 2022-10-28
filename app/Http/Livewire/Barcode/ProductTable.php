<?php

namespace App\Http\Livewire\Barcode;

use App\Models\Product;
use Barryvdh\Snappy\Facades\SnappyPdf;
use Livewire\Component;
use Milon\Barcode\Facades\DNS1DFacade;

class ProductTable extends Component
{
    public $product;
    public $quantity;
    public $barcodes;

    protected $listeners = ['productSelected'];

    public function mount() {
        $this->product = '';
        $this->quantity = 0;
        $this->barcodes = [];
    }

    public function render() {
        return view('livewire.barcode.product-table');
    }

    public function productSelected(Product $product) {
        $this->product = $product;
        $this->quantity = 1;
        $this->barcodes = [];
    }

    public function generateBarcodes(Product $product, $quantity) {
        if ($quantity > 100) {
            return session()->flash('message', 'Max quantity is 100 per barcode generation!');
        }

        $this->barcodes = [];

        for ($i = 1; $i <= $quantity; $i++) {
            $barcode = DNS1DFacade::getBarCodeSVG($product->product_code, $product->product_barcode_symbology,2 , 60, 'black', false);
            // dd($barcode);
            array_push($this->barcodes, $barcode);
        }
    }

    public function getPdf() {
        // dd(count($this->barcodes));

        $sizePaper = count($this->barcodes) * 25;
        $pdf = SnappyPdf::loadView('Admin.product.barcode.print', [
            'barcodes' => $this->barcodes,
            'price' => $this->product->product_price,
            'name' => $this->product->product_name,
        ])
        ->setOption('margin-top', 1)
        ->setOption('margin-bottom', 0)
        ->setOption('margin-left', 5)
        ->setOption('margin-right', 5)
        ->setOption('page-width', '40')
        ->setOption('page-height', $sizePaper);

        return $pdf->stream('barcodes-'. $this->product->product_code .'.pdf');
    }

    public function updatedQuantity() {
        $this->barcodes = [];
    }
}
