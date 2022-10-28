<?php

namespace App\Http\Controllers\Admin\Product;

use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Gate;

class BarcodeController extends Controller
{

    public function printBarcode() {
        abort_if(Gate::denies('print_barcodes'), 403);

        return view('Admin.product.barcode.index');
    }

}
