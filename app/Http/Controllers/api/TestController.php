<?

declare(strict_types=1);

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Aws\Api\Serializer\JsonBody;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class TestController extends Controller
{
    /**
     * Display the specified resource.
     */
    public function show(): JsonResponse
    {
        return response()->json(["status" =>"success"]);
    }
}
